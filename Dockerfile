# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# A image for building/testing brpc
FROM ubuntu:18.04

# prepare env
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        apt-utils \
        openssl \
        ca-certificates \
	htop \
	tmux

# install deps
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        g++ \
        make \
	cmake \
        libssl-dev \
        libgflags-dev \
        libprotobuf-dev \
        libprotoc-dev \
        protobuf-compiler \
        libleveldb-dev \
        libsnappy-dev && \
        apt-get clean -y

RUN git clone --depth=1 https://github.com/apache/incubator-brpc.git brpc && \
    cd /brpc/cmake && mkdir build && cd build && cmake ../.. && \
    make -j "$(nproc)" && make install && cd / && rm /brpc -rf
