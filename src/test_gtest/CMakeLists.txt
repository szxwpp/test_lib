# Now simply link against gtest or gtest_main as needed. Eg
add_executable(test_gtest test_gtest.cpp)
target_link_libraries(test_gtest gtest_main)
add_test(NAME test_gtest_test COMMAND test_gtest)
