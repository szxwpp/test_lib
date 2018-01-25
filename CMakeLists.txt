cmake_minimum_required(VERSION 2.8)
project(test_lib)
set(TARGET_VERSION "1.0.0" CACHE STRING "logical version")
set(TARGET_SOVERSION "1.0.0" CACHE STRING "soname version")
add_definitions(-DVERSION=${TARGET_VERSION})


######################## set compiler #####################
if(UNIX)
   set(CMAKE_C_COMPILER "/usr/bin/gcc")
   set(CMAKE_CXX_COMPILER "/usr/bin/g++")
#  set(CMAKE_C_COMPILER "/usr/bin/clang")
#  set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -pthread")
endif(UNIX)



###################### add definitions ###################
# set definitions
if(WIN32)
add_definitions(-DWIN32)
endif(WIN32)
if(UNIX)
add_definitions(-DUNIX)
endif(UNIX)



################ set debug and release options ################ 
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_BUILD_TYPE "Release")
#set(CMAKE_CONFIGURATION_TYPES Debug Release)



################ set install and uninstall ################# 
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)

if(UNIX)
    add_custom_target(uninstall rm -r ${PROJECT_SOURCE_DIR}/install)
endif(UNIX)


install(DIRECTORY ${PROJECT_SOURCE_DIR}/scripts/ DESTINATION scripts)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/resource/ DESTINATION resource)



################ output path ################# 
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)


################ thirdparty include and link ################# 
include_directories(${PROJECT_SOURCE_DIR}/include)
link_directories(${PROJECT_SOURCE_DIR}/lib)


################ add subdirectory ################# 
if(WIN32)
	add_subdirectory(src/test_boost)
	#add_subdirectory(src/test_protobuf)
	add_subdirectory(src/test_dlib)
	add_subdirectory(src/test_g3log)
	add_subdirectory(src/test_gflag)
	#add_subdirectory(src/test_gtest)
endif(WIN32)

if(UNIX)
    add_subdirectory(src/caffe)
endif(UNIX)