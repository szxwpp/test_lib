################ install dependences ################# 
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ DESTINATION include)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/lib/ DESTINATION lib)



################ thirdparty include and link ################# 
include_directories(${PROJECT_SOURCE_DIR}/include)
link_directories(${PROJECT_SOURCE_DIR}/lib/caffe)
