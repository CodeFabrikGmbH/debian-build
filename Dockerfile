FROM debian:bookworm-slim

# Basis-Tools
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
    build-essential \
    rustc \
    cargo \
    && rm -rf /var/lib/apt/lists/*

# Oxipng via Cargo installieren
RUN cargo install oxipng
ENV PATH="/root/.cargo/bin:${PATH}"

# Python-virtualenv erstellen
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Python-Pakete in venv installieren
RUN pip install --upgrade pip
RUN pip install requests
