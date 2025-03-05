FROM python:3.9-slim

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install llama-cpp-python
RUN pip install llama-cpp-python

WORKDIR /workspace

# Copy application files
COPY . /workspace

# Install Python dependencies
RUN pip install --no-cache-dir runpod

# Download GGUF model
RUN curl -L -o /workspace/Lumimaid-v0.2-12B.q5_k_m.gguf \
    https://huggingface.co/NeverSleep/Lumimaid-v0.2-12B-GGUF/resolve/main/Lumimaid-v0.2-12B.q5_k_m.gguf

CMD ["python", "-u", "handle.py"]
