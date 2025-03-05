FROM dustynv/llama_cpp:0.3.7-r36.4.0-cu128-24.04

WORKDIR /workspace

# Copy required files
COPY . /workspace

# Install dependencies
RUN pip install --no-cache-dir runpod

# Download the GGUF model file
RUN curl -L -o /workspace/Lumimaid-v0.2-12B.q5_k_m.gguf \
    https://huggingface.co/NeverSleep/Lumimaid-v0.2-12B-GGUF/resolve/main/Lumimaid-v0.2-12B.q5_k_m.gguf

# Uncomment for local testing
# RUN pip install llama-cpp-python==0.1.78

CMD ["python", "-u", "handle.py"]