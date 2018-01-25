include(${PROJECT_SOURCE_DIR}/cmake/ProtobufGen.cmake)

file(GLOB SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/*.pb.cc)
file(GLOB HEADER_FILES ${CMAKE_CURRENT_SOURCE_DIR}/*.pb.h)


# compile static library
add_library(proto STATIC ${SRC_FILES} ${HEADER_FILES})
list(APPEND PROTO_LINK_LIB libprotobuf.lib libprotobuf-lite.lib libprotoc.lib)
target_link_libraries(proto ${PROTO_LINK_LIB})
install(TARGETS proto ARCHIVE DESTINATION lib)


# compile shared library
#list(APPEND LIB_FILES libprotobuf.lib libprotobuf-lite.lib libprotoc.lib)
#list(APPEND LIB_FILES protobuf protobuf-lite protoc)
#foreach(LIB_VAR ${LIB_FILES})
# 	find_library(FIND_LIB_VAR ${LIB_VAR} ${PROJECT_SOURCE_DIR}/thirdparty/lib)
#	if(FIND_LIB_VAR)
#		message(STATUS "${LIB_VAR} has been found")
#	else(FIND_LIB_VAR)
#		message(WARNING "${LIB_VAR} has been not found")
#	endif(FIND_LIB_VAR)
#endforeach(LIB_VAR)
#add_library(proto_shared SHARED ${SRC_FILES} ${HEADER_FILES})
#target_link_libraries(proto_shared ${LIB_FILES})
# set the version
#set_target_properties(proto PROPERTIES VERSION 1.2 SOVERSION 1)
# change name
#set_target_properties(proto_shared PROPERTIES OUTPUT_NAME "proto")
#install(TARGETS proto_shared DESTINATION lib)


