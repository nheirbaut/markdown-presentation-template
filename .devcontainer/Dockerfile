FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    default-jre \
    graphviz \
    fonts-dejavu \
    wget \
    ca-certificates && \
    wget "https://github.com/plantuml/plantuml/releases/download/v1.2025.2/plantuml-1.2025.2.jar" -O /opt/plantuml.jar && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a wrapper script to run PlantUML
RUN echo '#!/bin/bash\njava -jar /opt/plantuml.jar "$@"' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml