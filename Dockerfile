FROM debian:bookworm-slim

# Install Basis-Tools und Optimizer
RUN apt-get update && apt-get install -y \
    bash \
    jq \
    curl \
    git \
    python3 \
    python3-pip \
    pngquant \
    jpegoptim \
    webp \
    build-essential \
    curl \
    ca-certificates \
    rustc \
    cargo \
    && rm -rf /var/lib/apt/lists/*

# Python-Module
RUN pip3 install requests

# Oxipng über Cargo installieren
RUN cargo install oxipng

# Oxipng Binaries in PATH bringen
ENV PATH="/root/.cargo/bin:${PATH}"
