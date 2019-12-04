cmake_minimum_required(VERSION 2.8.12)

project(grpc_test)

find_package(PkgConfig REQUIRED)
pkg_search_module(GRPC REQUIRED grpc++)

find_package(Protobuf 3.0.0 REQUIRED)

# Build protos.
execute_process(COMMAND ${PROTOBUF_PROTOC_EXECUTABLE}
  -I ${CMAKE_SOURCE_DIR}
  --cpp_out=${CMAKE_SOURCE_DIR}
  --grpc_out=${CMAKE_SOURCE_DIR}
  --plugin=protoc-gen-grpc=/usr/bin/grpc_cpp_plugin  # requires protobuf-compiler-grpc
  ${CMAKE_SOURCE_DIR}/helloworld.proto
  )
set(PROTOC_OUTPUT
    ${CMAKE_SOURCE_DIR}/helloworld.pb.h
    ${CMAKE_SOURCE_DIR}/helloworld.pb.cc
    ${CMAKE_SOURCE_DIR}/helloworld.grpc.pb.h
    ${CMAKE_SOURCE_DIR}/helloworld.grpc.pb.cc
    )

# Build executable.
add_executable(greeter_server greeter_server.cc ${PROTOC_OUTPUT})
target_include_directories(greeter_server PUBLIC ${CMAKE_SOURCE_DIR})
target_link_libraries(greeter_server grpc++ ${PROTOBUF_LIBRARY})
