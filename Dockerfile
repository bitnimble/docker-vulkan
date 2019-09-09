# Vulkan devel image 

FROM ubuntu:16.04 as vulkan-khronos

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    libx11-xcb-dev \
    libxkbcommon-dev \
    libwayland-dev \
    libxrandr-dev \
    libegl1-mesa-dev \
    python3 \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Install cmake version 3.15
RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.tar.gz && \
    tar -xvf cmake-3.15.2-Linux-x86_64.tar.gz && cp cmake-3.15.2-Linux-x86_64/bin/cmake /usr/local/bin && \
    mkdir -p /usr/local/share/cmake-3.15 && \
    cp -r cmake-3.15.2-Linux-x86_64/share/cmake-3.15/* /usr/local/share/cmake-3.15 && \
    rm -rf cmake-3.15.2-Linux-x86_64*


# Download and compile vulkan components
RUN ln -s /usr/bin/python3 /usr/bin/python && \
    git clone https://github.com/KhronosGroup/Vulkan-ValidationLayers.git /opt/vulkan && \
    cd /opt/vulkan && git checkout $(git describe --tags `git rev-list --tags --max-count=1`) && \
    mkdir build && cd build && ../scripts/update_deps.py && \
    cmake -C helper.cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . && make install && ldconfig && \
    mkdir -p /usr/local/lib && cp -a Vulkan-Loader/build/install/lib/* /usr/local/lib && \
    mkdir -p /usr/local/include/vulkan && cp -r Vulkan-Headers/build/install/include/vulkan/* /usr/local/include/vulkan && \
    mkdir -p /usr/local/share/vulkan/registry && \
    cp -r Vulkan-Headers/build/install/share/vulkan/registry/* /usr/local/share/vulkan/registry && \
    rm -rf /opt/vulkan



FROM nvidia/cudagl:10.1-base-ubuntu16.04

ENV NVIDIA_DRIVER_CAPABILITIES compute,graphics,utility

RUN apt-get update && apt-get install -y --no-install-recommends \
    libx11-xcb-dev \
    libxkbcommon-dev \
    libwayland-dev \
    libxrandr-dev \
    libegl1-mesa-dev && \
    rm -rf /var/lib/apt/lists/*

COPY --from=vulkan-khronos /usr/local/bin /usr/local/bin
COPY --from=vulkan-khronos /usr/local/lib /usr/local/lib
COPY --from=vulkan-khronos /usr/local/include/vulkan /usr/local/include/vulkan
COPY --from=vulkan-khronos /usr/local/share/vulkan /usr/local/share/vulkan
COPY --from=vulkan-khronos /usr/local/share/cmake-3.15 /usr/local/share/cmake-3.15

COPY nvidia_icd.json /etc/vulkan/icd.d/nvidia_icd.json
