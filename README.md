## Docker

View the published images here: https://hub.docker.com/r/kastanday/maple_ngc_scratch_pip/tags


```bash
# 1. Must be x64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
# 2. Build image
docker build -t kastanday/ngc_tf1:latest .
# 3. Run image to check installed packages work
docker run -it kastanday/ngc_tf1:latest /bin/bash
```

## Apptainer (formerly Singularity)

To convert docker -> singularity/apptainer: 

```bash
apptainer pull docker://kastanday/ngc_tf1:latest
# WARNING: Fast internet recommended. This takes a long time and uses significant disk space.
```
 Note:  Delta does NOT support building images (like in this command).
 Note: By default, only the $HOME dir is mounted in the container. You can specify flags to have other dirs mounted too. 
 
 
## Documentation

Nvidia NGC docs: https://docs.nvidia.com/ngc/pdf/NGC-User-Guide.pdf 

Delta Apptainer/Singularity guide: https://wiki.ncsa.illinois.edu/display/DSC/Delta+User+Guide#DeltaUserGuide-Apptainer(formerlySingularity)

## Delta Supercomputer

Standard run command for single Node. (Multi-node is a bit harder.)

Note: Delta does NOT support building images (yet, so they say). Images must be **built elsewhere** then transferred to Delta.

```bash
export MY_ACCOUNT=<👉YOUR_GPU_ALLOCATION_HERE👈> && \
export CONTAINER=<👉PATH TO LOCAL IMAGE FILE maple_ngc_scratch_pip_mini.sif👈> && \
srun \
 --mem=32g \
 --nodes=1 \
 --ntasks-per-node=1 \
 --cpus-per-task=1 \
 --partition=gpuA100x4 \
 --account=${MY_ACCOUNT} \
 --time=00:30:00 \
 --gpus-per-node=1 \
 --gpus-per-task=1 \
 --gpu-bind=verbose,per_task:1 \
 --pty \
 singularity run --nv ${CONTAINER} /bin/bash
 ```
