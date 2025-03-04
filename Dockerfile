FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel

WORKDIR /workspace

COPY /workspace /workspace

RUN pip install runpod
RUN wget -O Lumimaid-v0.2-12B.q8_0.gguf https://huggingface.co/NeverSleep/Lumimaid-v0.2-12B-GGUF/resolve/main/
ENV CUDA_DOCKER_ARCH=all
ENV LLAMA_CUBLAS=1
RUN CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 pip install llama-cpp-python==0.1.78

# for local test
# RUN pip install llama-cpp-python==0.1.78

CMD ["/bin/bash"]

# CMD ["python", "-u", "handle.py"]
