#!/bin/bash

apt-get update && apt-get -y install \
  build-essential \
  cmake \
  gdb \
  libgrpc++-dev \
  libprotobuf-dev \
  pkg-config \
  protobuf-compiler-grpc
