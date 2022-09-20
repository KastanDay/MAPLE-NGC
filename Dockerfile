FROM nvcr.io/nvidia/tensorflow:19.10-py3

# 1. MUST be x64
# export DOCKER_DEFAULT_PLATFORM=linux/amd64
# 2.
# docker build -t kastanday/maple_ngc_scratch_pip:mini .
# 3. 
# docker run -it kastanday/maple_minimamba /bin/bash

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

# these args are untested, and probably unnecessary. Try adding if problems w gdal. 
# might need to switch ARG to ENV
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

RUN /usr/bin/python -m pip install --upgrade pip
RUN pip install gdal==2.2.3 opencv-python==4.5.3.56 keras==2.0.8 scikit-image shapely pyshp cached_property tifffile pyparsing cycler python-dateutil h5py==2.10.0

