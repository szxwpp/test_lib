add_definitions(-DDLIB_JPEG_SUPPORT)



add_executable(dlib_face_recognition dnn_face_recognition_ex.cpp)
target_link_libraries(dlib_face_recognition dlib)
install(TARGETS dlib_face_recognition RUNTIME DESTINATION bin)