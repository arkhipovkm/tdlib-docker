FROM alpine:3.13.1

RUN apk --no-cache add alpine-sdk linux-headers git zlib-dev openssl-dev gperf php cmake
RUN git clone --depth 1 --branch v1.7.0 https://github.com/tdlib/td.git
RUN cd td && rm -rf build && mkdir build
WORKDIR /td/build/
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
RUN cmake --build . --target install
RUN cp -r /td/tdlib /usr/local