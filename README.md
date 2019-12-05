Minimal example that uses the [hello world server](https://raw.githubusercontent.com/grpc/grpc/master/examples/cpp/helloworld/greeter_server.cc).

```
./install_debs.sh
./run.sh
```

* crashes with `grpc (1.3.2-1.1~build1) bionic` due to https://github.com/grpc/grpc/issues/11195
* works with [Debian's grpc 1.3.2-1](https://snapshot.debian.org/binary/libgrpc%2B%2B-dev/)
