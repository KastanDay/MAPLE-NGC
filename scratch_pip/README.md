## Docker

View the published images here: https://hub.docker.com/r/kastanday/maple_ngc_scratch_pip/tags


```bash
# 1. Must be x64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
# 2. Build image
docker build -t kastanday/maple_ngc_scratch_pip:mini .
# 3. Run image to check installed packages work
docker run -it kastanday/maple_minimamba /bin/bash
```

## Singularity

To convert docker -> singularity/apptainer: 

```bash
apptainer pull docker://kastanday/maple_ngc_scratch_pip:mini
# WARNING: Fast internet recommended. This takes a long time and uses significant disk space.
 ```
 
