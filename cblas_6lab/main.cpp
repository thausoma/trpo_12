#include <iostream>
#include <vector>
#include <chrono>
#include <cmath>
#include <iomanip>
#include <omp.h>
#include "../OpenBLAS/cblas.h"
#include <numeric>
#include <algorithm> // Для std::min

using namespace std;

const int BLOCK_SIZE = 64; 

// Твой оптимизированный GEMM
template <typename T>
void optimized_gemm(int M, int N, int K, T alpha, const T* A, const T* B, T beta, T* C) {
    // 1. Инициализация C с учетом beta
    #pragma omp parallel for collapse(2)
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            C[i * N + j] *= beta;
        }
    }

    // 2. Блочное перемножение (Tiling)
    #pragma omp parallel for
    for (int i_block = 0; i_block < M; i_block += BLOCK_SIZE) {
        for (int k_block = 0; k_block < K; k_block += BLOCK_SIZE) {
            for (int j_block = 0; j_block < N; j_block += BLOCK_SIZE) {
                
                for (int i = i_block; i < min(i_block + BLOCK_SIZE, M); ++i) {
                    for (int k = k_block; k < min(k_block + BLOCK_SIZE, K); ++k) {
                        T temp = alpha * A[i * K + k];
                        for (int j = j_block; j < min(j_block + BLOCK_SIZE, N); ++j) {
                            C[i * N + j] += temp * B[k * N + j];
                        }
                    }
                }
            }
        }
    }
}

// Среднее геометрическое
double calc_geometric_average(const vector<double>& measurements) {
    double log_sum = 0.0;
    for (auto val : measurements) log_sum += log(val);
    return exp(log_sum / measurements.size());
}

// Обертки для эталона
void compute_reference(int M, int N, int K, float alpha, const float* A, const float* B, float beta, float* C) {
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, M, N, K, alpha, A, K, B, N, beta, C, N);
}

void compute_reference(int M, int N, int K, double alpha, const double* A, const double* B, double beta, double* C) {
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, M, N, K, alpha, A, K, B, N, beta, C, N);
}

// Умная проверка точности
template <typename T>
bool verify_correctness(int size, const T* mine, const T* ref) {
    T max_diff = 0;
    for (int i = 0; i < size; ++i) {
        T diff = abs(mine[i] - ref[i]);
        if (diff > max_diff) max_diff = diff;
    }
    
    // Адаптивный порог: для float (4 байта) он мягче, для double (8 байт) — жестче
    double threshold = (sizeof(T) == 4) ? 1.0e-1 : 1.0e-9;
    
    if (max_diff > threshold) {
        cout << " [Max Diff: " << max_diff << " > " << threshold << "] ";
        return false;
    }
    return true;
}

template <typename T>
void start_performance_analysis(int num_threads, int matrix_dim, string label) {
    omp_set_num_threads(num_threads);
    openblas_set_num_threads(num_threads);

    T a_coeff = 1.0, b_coeff = 0.0;
    // Инициализируем небольшими значениями, чтобы избежать дикого разброса ошибок
    vector<T> matA(matrix_dim * matrix_dim, 0.1), matB(matrix_dim * matrix_dim, 0.01);
    vector<T> matC_custom(matrix_dim * matrix_dim, 0.0), matC_ref(matrix_dim * matrix_dim, 0.0);
    
    vector<double> custom_stats, blas_stats;

    // Считаем эталон и свой вариант один раз для проверки
    compute_reference(matrix_dim, matrix_dim, matrix_dim, a_coeff, matA.data(), matB.data(), b_coeff, matC_ref.data());
    optimized_gemm(matrix_dim, matrix_dim, matrix_dim, a_coeff, matA.data(), matB.data(), b_coeff, matC_custom.data());

    if (!verify_correctness(matrix_dim * matrix_dim, matC_custom.data(), matC_ref.data())) {
        cout << "| " << setw(8) << label << " | " << setw(7) << num_threads << " | ERROR: Results mismatch! |" << endl;
        return;
    }

    // Замеры
    for (int iter = 0; iter < 10; ++iter) {
        auto t_start = chrono::high_resolution_clock::now();
        optimized_gemm(matrix_dim, matrix_dim, matrix_dim, a_coeff, matA.data(), matB.data(), b_coeff, matC_custom.data());
        auto t_end = chrono::high_resolution_clock::now();
        custom_stats.push_back(chrono::duration<double>(t_end - t_start).count());

        t_start = chrono::high_resolution_clock::now();
        compute_reference(matrix_dim, matrix_dim, matrix_dim, a_coeff, matA.data(), matB.data(), b_coeff, matC_ref.data());
        t_end = chrono::high_resolution_clock::now();
        blas_stats.push_back(chrono::duration<double>(t_end - t_start).count());
    }

    double avg_custom = calc_geometric_average(custom_stats);
    double avg_blas = calc_geometric_average(blas_stats);
    double ratio = (avg_blas / avg_custom) * 100.0;

    cout << "| " << setw(8) << label << " | " << setw(7) << num_threads << " | " 
         << setw(13) << fixed << setprecision(4) << avg_custom << " | " 
         << setw(12) << avg_blas << " | " 
         << setw(10) << setprecision(2) << ratio << "% |" << endl;
}

int main() {
    // Подбери размер так, чтобы "Мое время" на 1 потоке было около 60 сек.
    int dimension = 2000; 
    int cores[] = {1, 2, 4, 8, 16};

    cout << "\nРезультаты тестирования производительности GEMM (Tiling vs OpenBLAS)\n";
    cout << "----------------------------------------------------------------------------" << endl;
    cout << "| Тип      | Потоки  | Мое время (с) | OpenBLAS (с) | Эффективность |" << endl;
    cout << "----------------------------------------------------------------------------" << endl;

    for (int c : cores) {
        start_performance_analysis<float>(c, dimension, "float");
        start_performance_analysis<double>(c, dimension, "double");
    }
    
    cout << "----------------------------------------------------------------------------" << endl;
    return 0;
}