FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    bash \
    jq \
    curl \
    python3 \
    python3-pip \
    pngquant \
    jpegoptim \
    webp \
    oxipng \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install requests