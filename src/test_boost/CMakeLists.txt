##### asio
add_definitions(-DASIO_STANDALONE)
add_executable(asio_server asio/chat_server.cpp asio/chat_message.hpp)
add_executable(asio_client asio/chat_client.cpp asio/chat_message.hpp)
install(TARGETS asio_server RUNTIME DESTINATION bin)
install(TARGETS asio_client RUNTIME DESTINATION bin)

