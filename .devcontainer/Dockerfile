FROM mcr.microsoft.com/devcontainers/base:bookworm

RUN apt-get update \
    && apt-get install -y \
        plantuml \
        python3 \
        curl \
        make \
        pandoc \
    && rm -rf /var/lib/apt/lists/*
