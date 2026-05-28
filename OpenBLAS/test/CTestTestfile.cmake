# CMake generated Testfile for 
# Source directory: /home/kirill/Desktop/12lab/OpenBLAS/test
# Build directory: /home/kirill/Desktop/12lab/OpenBLAS/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(sblas1 "/home/kirill/Desktop/12lab/OpenBLAS/test/sblat1")
set_tests_properties(sblas1 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;107;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(sblas2 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/sblat2" "/home/kirill/Desktop/12lab/OpenBLAS/test/sblat2.dat" "SBLAT2.SUMM")
set_tests_properties(sblas2 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;109;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(sblas3 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/sblat3" "/home/kirill/Desktop/12lab/OpenBLAS/test/sblat3.dat" "SBLAT3.SUMM")
set_tests_properties(sblas3 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;111;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(dblas1 "/home/kirill/Desktop/12lab/OpenBLAS/test/dblat1")
set_tests_properties(dblas1 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;107;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(dblas2 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/dblat2" "/home/kirill/Desktop/12lab/OpenBLAS/test/dblat2.dat" "DBLAT2.SUMM")
set_tests_properties(dblas2 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;109;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(dblas3 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/dblat3" "/home/kirill/Desktop/12lab/OpenBLAS/test/dblat3.dat" "DBLAT3.SUMM")
set_tests_properties(dblas3 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;111;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(cblas1 "/home/kirill/Desktop/12lab/OpenBLAS/test/cblat1")
set_tests_properties(cblas1 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;107;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(cblas2 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/cblat2" "/home/kirill/Desktop/12lab/OpenBLAS/test/cblat2.dat" "CBLAT2.SUMM")
set_tests_properties(cblas2 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;109;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(cblas3 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/cblat3" "/home/kirill/Desktop/12lab/OpenBLAS/test/cblat3.dat" "CBLAT3.SUMM")
set_tests_properties(cblas3 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;111;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(cblas3_3m "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/cblat3_3m" "/home/kirill/Desktop/12lab/OpenBLAS/test/cblat3_3m.dat" "CBLAT3_3M.SUMM")
set_tests_properties(cblas3_3m PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;115;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(zblas1 "/home/kirill/Desktop/12lab/OpenBLAS/test/zblat1")
set_tests_properties(zblas1 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;107;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(zblas2 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/zblat2" "/home/kirill/Desktop/12lab/OpenBLAS/test/zblat2.dat" "ZBLAT2.SUMM")
set_tests_properties(zblas2 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;109;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(zblas3 "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/zblat3" "/home/kirill/Desktop/12lab/OpenBLAS/test/zblat3.dat" "ZBLAT3.SUMM")
set_tests_properties(zblas3 PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;111;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
add_test(zblas3_3m "sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/test_helper.sh" "/home/kirill/Desktop/12lab/OpenBLAS/test/zblat3_3m" "/home/kirill/Desktop/12lab/OpenBLAS/test/zblat3_3m.dat" "ZBLAT3_3M.SUMM")
set_tests_properties(zblas3_3m PROPERTIES  _BACKTRACE_TRIPLES "/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;115;add_test;/home/kirill/Desktop/12lab/OpenBLAS/test/CMakeLists.txt;0;")
