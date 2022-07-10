FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install pre-requisites
RUN apt update
RUN apt install cmake g++ gcc wget xz-utils python3 python3-pip python3-distutils curl llvm pkg-config m4 -y

ENTRYPOINT ["sleep","infinity"]
