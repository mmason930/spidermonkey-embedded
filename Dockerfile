FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Install pre-requisites
RUN apt update
RUN apt install g++ gcc wget xz-utils python3 python3-pip python3-distutils curl llvm pkg-config m4 libmozjs-91-0 libmozjs-91-dev -y
ADD src /src
ADD docker-start.sh /docker-start.sh
WORKDIR /src

ENTRYPOINT ["/docker-start.sh"]
