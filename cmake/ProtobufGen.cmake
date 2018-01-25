# find protoc
find_program(PROTOC protoc ${PROJECT_SOURCE_DIR}/bin)
if(PROTOC)
	message(STATUS "protoc has been found")
else(PROTOC)
	message(STATUS "protoc has not been found" fatal_error)
endif(PROTOC)


# generate {.h|.cc}
file(GLOB PROTO_FILES ${PROJECT_SOURCE_DIR}/src/test_protobuf/*.proto)
execute_process(COMMAND ${PROTOC} -I=${PROJECT_SOURCE_DIR}/src/test_protobuf --cpp_out=${PROJECT_SOURCE_DIR}/src/test_protobuf ${PROTO_FILES})