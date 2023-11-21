FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt-get update \
    && apt-get install -y \
    make \
    pandoc \
    plantuml \
    python3 \
    && rm -rf /var/lib/apt/lists/*
