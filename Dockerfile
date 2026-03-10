# Stage 1: Build Oxipng
FROM rust:1.78 as builder
RUN cargo install oxipng

# Stage 2: Final Container
FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y \
    bash \
    jq \
    curl \
    git \
    python3 \
    python3-venv \
    python3-pip \
    pngquant \
    jpegoptim \
    webp \
    && rm -rf /var/lib/apt/lists/*

# Python venv
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install requests

# Oxipng vom Builder kopieren
COPY --from=builder /usr/local/cargo/bin/oxipng /usr/local/bin/oxipng

# Prüfen
RUN oxipng --version
