# Ubuntu 16.04

## Quickstart

**Make sure you have installed the latest [NVIDIA driver](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) and the [NVIDIA Container Runtime](https://github.com/NVIDIA/nvidia-docker).**

## CUDA 10.1 + OpenGL (glvnd 1.1) + Vulkan 1.1.121

- `1.1.121-cuda-10.1-beta.0-ubuntu16.04` [(*docker/ubuntu16.04*)](https://gitlab.com/nvidia/container-images/vulkan/-/blob/beta.0/docker/Dockerfile.ubuntu16.04)
- `1.1.121-cuda-10.1-beta.0-ubuntu18.04`, `1.1.121` [(*docker/ubuntu18.04*)](https://gitlab.com/nvidia/container-images/vulkan/-/blob/beta.0/docker/Dockerfile.ubuntu18.04)

- `1.1.121-cuda-10.1-alpha` [(*10.1/base/Dockerfile*)](https://gitlab.com/nvidia/cuda/blob/ubuntu16.04/10.1/base/Dockerfile) + [(*glvnd/devel/Dockerfile*)](https://gitlab.com/nvidia/container-images/opengl/blob/ubuntu16.04/glvnd/devel/Dockerfile) + [(*vulkan/Dockerfile*)](https://gitlab.com/nvidia/container-images/vulkan/blob/ubuntu16.04/Dockerfile)

## Run
```
# To run the container
# Docker >= 19.03
# docker run --gpus all -ti --rm nvidia/vulkan:1.1.121

# Docker < 19.03
# docker run --runtime=nvidia -ti --rm nvidia/vulkan:1.1.121

# To build and run the vulkan samples
Find instructions here: https://gitlab.com/nvidia/container-images/samples/tree/master/vulkan/ubuntu16.04
```

## Versioning

The Vulkan container posses four major components:
- The Vulkan Version (e.g: 1.1.121)
- The CUDA Version (e.g: 10.1)
- The Version of the container (e.g: beta.0)
- The platform of the container (e.g: ubuntu18.03)

The overall version of the Vulkan container has two forms:
- The long form: `${VULKAN_VERSION}-cuda-${CUDA_VERSION}-${CONTAINER_VERSION}-${PLATFORM}`
- The short form: `${VULKAN_VERSION}`

The long form is a unique tag that once pushed will always refer to the same container.
This means that no updates will be made to that tag and it will always point to the same container.

The short form refers to the latest CONTAINER_VERSION and CUDA_VERSION with the platform fixed to ubuntu18.04.
In practice this tag is rarely updated and we are more likely to bump the CUDA_VERSION with an update of the VULKAN_VERSION.

We do not maintain multiple version branches.

## Releases

Release of newer versions is done on demand and does not follow Vulkan's release cadence.
All commit to the master branch generates an image on the gitlab registry.
Tagging a version will push an image to the nvidia/vulkan repository on the Dockerhub

## Issues and Contributing

[Checkout the Contributing document!](CONTRIBUTING.md)

* Please let us know by [filing a new issue](https://github.com/NVIDIA/nvidia-docker/issues/new)
* You can contribute by opening a [pull request on the gitlab repository](https://gitlab.com/nvidia/container-images/vulkan)
