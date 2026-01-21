FROM gradescope/autograder-base:ubuntu-jammy

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
WORKDIR /autograder/grader

# Install dependencies
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked --no-install-project

# Copy the project into the image
ADD . /autograder/grader
ADD run_autograder /autograder/run_autograder

# Sync the project
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked
