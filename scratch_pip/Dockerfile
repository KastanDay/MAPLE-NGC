FROM nvcr.io/nvidia/tensorflow:22.05-tf1-py3

# 1. MUST be x64 (no 3.6 in aarch64)
# export DOCKER_DEFAULT_PLATFORM=linux/amd64
# 2.
# docker build -t kastanday/maple_minimamba .
# 3.
# docker run kastanday/maple_minimamba
# Optional (interactive)
# docker run -i -t kastanday/maple_minimamba /bin/bash

LABEL name="maple_ngc_scratch_pip"
LABEL summary="Build a GPU-enabled MAPLE container based on the exactly proper tf1 Nvidia NGC containers."
LABEL URL="https://github.com/KastanDay/MAPLE-NGC"
LABEL maintaner="Kastan Day"
LABEL architecture="x86_64"
LABEL version="0.2"
LABEL release-date="2022-07-30"

WORKDIR /app

# necessary for cv2 https://exerror.com/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directory/
# and gdal
RUN apt-get update && apt-get install -y \
    curl     \
    wget     \
    build-essential     \
    ffmpeg     \
    libsm6     \
    libxext6   \
    gdal-bin   \
    libgdal-dev     \
    && apt-get clean


RUN /usr/bin/python -m pip install --upgrade pip
RUN pip install gdal opencv-python==4.5.3.56 scikit-image shapely pyshp cached_property keras tifffile pyparsing cycler python-dateutil h5py==2.10.0

# # Create the environment:
# RUN conda install -c conda-forge mamba && \
#     mamba create --name MAPLE_py36 python=3.6 -y
# # Make RUN commands use the new environment:
# RUN echo "conda activate MAPLE_py36" >> ~/.bashrc
# SHELL ["/bin/bash", "--login", "-c"]
# RUN mamba install -c conda-forge tensorflow=1.14 gdal opencv=4.5.3 scikit-image shapely pyshp cached_property keras tifffile pyparsing cycler python-dateutil h5py=2.10.0
# RUN mamba clean -a -y

# install pyclowder
# COPY requirements.txt ./
# RUN pip install -r requirements.txt

# # The code to run when container is started:
# COPY maple_cpu.py extractor_info.json MAPLE ./

# CMD python maple_cpu.py
