FROM ubuntu:jammy

# Install uv package manager
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean all -y
RUN apt-get update -y &&\
apt-get install -y\
    build-essential\
    cmake\
    gdb\
    dos2unix\
    neovim\
    golang\
    python3\
    python3-pip\
    python3-dev\
    iverilog

# Change the working directory to the `app` directory
WORKDIR /app
