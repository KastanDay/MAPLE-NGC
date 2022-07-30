FROM nvcr.io/nvidia/tensorflow:22.05-tf1-py3

# 1. build
# export DOCKER_DEFAULT_PLATFORM=linux/amd64; docker build -t kastanday/ngc_tf1 .
# export DOCKER_DEFAULT_PLATFORM=linux/amd64; docker build -t kastanday/ngc_tf1 . --progress plain
# 2. run
#  docker run -t -i kastanday/ngc_tf1 -- bash

# todo: conda create --name MAPLE_py36 --file explicit.txt

LABEL name="MAPLE_ngc_tf1_singularity"
LABEL summary="Run MAPLE inside a customized Nvidia NGC container"
LABEL URL="https://github.com/KastanDay/MAPLE-NGC"
LABEL maintaner="Kastan Day"
LABEL architecture="x86_64"
LABEL version="0.1"
LABEL release-date="2022-07-28"


# if miniconda not found, try this. "/root/miniconda3/bin:$PATH"
RUN apt update \ 
    && apt install -y \
    curl \
    wget \
    build-essential \
    ffmpeg \
    libsm6 \
    libxext6 \
    && apt-get clean


## Miniconda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
ARG MINICONDA=Miniconda3-4.5.4-Linux-x86_64.sh
ARG MINICONDA_DOWNLOAD_URL=https://repo.anaconda.com/miniconda/$MINICONDA
RUN wget $MINICONDA_DOWNLOAD_URL
RUN bash $MINICONDA -b \
    && rm -f $MINICONDA


RUN uname -r


COPY explicit.txt .
# NOTE: couldn't get mamba to work in this same situation
RUN conda create --name MAPLE_py36 --file explicit.txt

# use the env
RUN echo "conda activate MAPLE_py36" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

# test the env
COPY entrypoint_script.sh ./
RUN chmod +x entrypoint_script.sh
COPY run.py ./
ENTRYPOINT ["./entrypoint_script.sh"]
