# Vulkan

## Quickstart

**Make sure you have installed the latest [NVIDIA driver](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) and the [NVIDIA Container Runtime](https://github.com/NVIDIA/nvidia-docker).**

## CUDA 11.4.2 + OpenGL (glvnd 1.1) + Vulkan 1.2.203

- `1.2.203-cuda-11.4.2-beta.0-ubuntu20.04` [(*11.4.2/base/Dockerfile*)](https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.4.2/ubuntu2004/base/Dockerfile) + [*(glvnd/devel/Dockerfile)*](https://gitlab.com/nvidia/container-images/opengl/-/blob/ubuntu20.04/glvnd/devel/Dockerfile) [(*vulkan/Dockerfile*)](https://github.com/anonymousthing/docker-vulkan/blob/master/docker/Dockerfile.ubuntu20.04)

## Run
```
# To run the container
# Docker >= 19.03
# docker run --gpus all -ti --rm ghcr.io/anonymousthing/vulkan:1.2.203-cuda-11.4.2-beta.0-ubuntu20.04

# To build and run the vulkan samples
Find instructions here: https://gitlab.com/nvidia/container-images/samples/tree/master/vulkan/ubuntu16.04
```

## Versioning

The Vulkan container posses four major components:
- The Vulkan Version (e.g: 1.2.203)
- The CUDA Version (e.g: 11.4.2)
- The Version of the container (e.g: beta.0)
- The platform of the container (e.g: ubuntu20.04)

The overall version of the Vulkan container has two forms:
- The long form: `${VULKAN_VERSION}-cuda-${CUDA_VERSION}-${CONTAINER_VERSION}-${PLATFORM}`
- The short form: `${VULKAN_VERSION}`
- The latest tag: `latest`

The long form is a unique tag that once pushed will always refer to the same container.
This means that no updates will be made to that tag and it will always point to the same container.

The short form refers to the latest CONTAINER_VERSION and CUDA_VERSION with the platform fixed to ubuntu18.04.
In practice this tag is rarely updated and we are more likely to bump the CUDA_VERSION with an update of the VULKAN_VERSION.

The latest tag refers to the latest short form.

Note: We do not maintain multiple version branches.

## Releases

Release of newer versions is done on demand and does not follow Vulkan's release cadence.
All commit to the master branch generates an image on the gitlab registry.
Tagging a version will push an image to the nvidia/vulkan repository on the Dockerhub

## Issues and Contributing

[Checkout the Contributing document!](CONTRIBUTING.md)

* Please let us know by [filing a new issue](https://github.com/NVIDIA/nvidia-docker/issues/new)
* You can contribute by opening a [pull request on the gitlab repository](https://gitlab.com/nvidia/container-images/vulkan)
