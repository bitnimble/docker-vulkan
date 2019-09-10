# Ubuntu 16.04

## Quickstart

**Make sure you have installed the latest [NVIDIA driver](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) and the [NVIDIA Container Runtime](https://github.com/NVIDIA/nvidia-docker).**

## CUDA 10.1 + OpenGL (glvnd 1.1) + Vulkan 1.1.121

- `1.1.121-cuda-10.1-alpha` [(*10.1/base/Dockerfile*)](https://gitlab.com/nvidia/cuda/blob/ubuntu16.04/10.1/base/Dockerfile) + [(*glvnd/devel/Dockerfile*)](https://gitlab.com/nvidia/container-images/opengl/blob/ubuntu16.04/glvnd/devel/Dockerfile) + [(*vulkan/Dockerfile*)](https://gitlab.com/nvidia/container-images/vulkan/blob/ubuntu16.04/Dockerfile)

## Run
```
# To run the container
# Docker >= 19.03
# docker run --gpus all -ti --rm nvidia/vulkan:1.1.121-cuda-10.1-alpha

# Docker < 19.03
# docker run --runtime=nvidia -ti --rm nvidia/vulkan:1.1.121-cuda-10.1-alpha

# To build and run the vulkan samples
Find instructions here: https://gitlab.com/nvidia/container-images/samples/tree/master/vulkan/ubuntu16.04
```