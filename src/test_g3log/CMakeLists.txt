# test g3log
add_executable(test_g3log test_g3log.cpp)
target_link_libraries(test_g3log g3logger)
# install(TARGETS test_g3log RUNTIME DESTINATION bin)
