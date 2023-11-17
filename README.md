# Mount-S3 Container Project

## Overview

The Mount-S3 Container Project enables seamless access to Amazon S3 storage within a Docker environment. This containerized solution allows developers to interact with S3 files using familiar commands, making it convenient to integrate S3 storage into their projects.

* Supprted OS: Linux, MacOS, Windows 
* Platforms: x86_64 and arm64 (change docker-compose.yaml to use arm64)

## Prerequisites

Before using the Mount-S3 Container Project, ensure that you have the following prerequisites installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone the Mount-S3 Container Project repository to your local machine:
   ```bash
   git clone https://github.com/whomobile/mount-s3.git
   ```
2. Navigate to the project directory:
   ```bash
   cd mount-s3
   ```

3. build the docker image
   ```bash
   docker-compose build
   ```

4. create a .env file
   ```bash
   cp env-sample .env
   ```

5. edit the .env file to include your AWS credentials

6. start the docker container
   ```bash
   docker-compose up -d
   ```


# Accessing S3 via Docker
Once the Mount-S3 Container is running, you can access the S3 storage within the Docker container using the following command:

```
docker-compose exec s3 bash
docker-compose exec s3 cp /mnt/s3/abc.txt /mnt/local/abc.txt
ls ./local/abc.txt
```


# Directory Structure

The Mount-S3 Container Project follows a directory structure that simplifies the interaction between your local machine and the S3 storage within the Docker container:

```
Local PC       Container 
   ./local----mnt/local: Mount point for local files in the S3 Docker container
                         Docker container accesses local files from here
              mnt/s3:   Mount point for AWS S3 storage via mount-s3/fuse
                 └── ...  # S3 files and directories

```

# Usage and Benefits

Integrate the Mount-S3 Container Project into your development workflow to enjoy the following benefits:

* Seamless Integration: Easily access and manipulate files in your S3 storage as if they were local files on your machine.
* Development Isolation: Run your development environment in a Docker container, ensuring consistency and reproducibility across different environments.
* Convenient Testing: Test your applications with S3 interactions in a controlled Docker environment, avoiding the need for direct cloud access during development and testing.
* Improved Collaboration: Share your Dockerized development environment with team members, streamlining collaboration and reducing compatibility issues.

# Contributing

We welcome contributions! If you encounter issues or have suggestions for improvements, please create a GitHub issue or submit a pull request.


# License

This project is licensed under the MIT License - see the LICENSE file for details.