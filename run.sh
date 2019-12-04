#!/bin/bash

set -e

mkdir -p build && cd build
cmake ..
make

ulimit -c unlimited
if ! ./greeter_server; then
  gdb ./greeter_server core
else
  echo "wohooo! gRPC survived!"
fi
