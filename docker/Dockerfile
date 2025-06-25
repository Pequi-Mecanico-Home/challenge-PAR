FROM osrf/ros:humble-desktop-full

# Avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install basic utilities
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    build-essential \
    python3-pip \
    python3-dev \
    wget \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install CUDA
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    apt-get update && apt-get install -y cuda-11-8 && \
    rm -rf /var/lib/apt/lists/* && \
    rm cuda-keyring_1.1-1_all.deb

# Install Ultralytics and PyTorch with CUDA support
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 && \
    pip3 install --no-cache-dir ultralytics

# Setup environment variables
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.8/lib64
ENV CUDA_HOME=/usr/local/cuda-11.8

# ROS environment is already set up in the base image

# Create workspace directory
RUN mkdir -p /workspace

WORKDIR /workspace

CMD ["/bin/bash"]