FROM dustynv/llama_cpp:0.3.7-r36.4.0-cu128-24.04

WORKDIR /workspace

COPY /workspace /workspace
RUN pip install runpod
RUN curl Lumimaid-v0.2-12B.q5_k_m.gguf https://huggingface.co/NeverSleep/Lumimaid-v0.2-12B-GGUF/resolve/main/Lumimaid-v0.2-12B.q5_k_m.gguf

# for local test
# RUN pip install llama-cpp-python==0.1.78

CMD ["/bin/bash"]

CMD ["python", "-u", "handle.py"]
