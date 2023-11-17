# Use the latest version of Ubuntu
FROM ubuntu:latest

ARG ARCH=x86_64
# or arm64

# Update the package list
RUN apt-get update

# Install the tools
RUN apt-get install -y vim grep wget curl fuse3
RUN apt-get install -y libfuse3-dev libfuse2
RUN wget https://s3.amazonaws.com/mountpoint-s3-release/latest/${ARCH}/mount-s3.deb \
    && dpkg -i mount-s3.deb \
    && rm mount-s3.deb

# docker run --cap-add SYS_ADMIN --device /dev/fuse your_image
# Clean up the package list to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /mnt/s3

COPY start.sh /mnt/start.sh

CMD /mnt/start.sh
