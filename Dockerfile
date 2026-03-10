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
    && rm -rf /var/lib/apt/lists/*

# Python-venv
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install requests

# Oxipng Binary direkt herunterladen
RUN curl -L -o /usr/local/bin/oxipng \
    https://github.com/shssoichiro/oxipng/releases/download/v10.1.0/oxipng-x86_64-unknown-linux-gnu \
    && chmod +x /usr/local/bin/oxipng

# Prüfen
RUN oxipng --version
