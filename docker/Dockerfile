FROM nvidia/cuda:12.2.2-runtime-ubuntu22.04

ARG UID
ARG GID
ARG USERNAME

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt update && \
    apt install -y tzdata && \
    apt install -y sudo && \
    addgroup --gid $GID $USERNAME && \
    adduser --uid $UID --gid $GID --disabled-password --gecos "" $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /workspace/template_project
