#!/bin/bash --login
# The --login ensures the bash configuration is loaded, enabling Conda.

# Enable strict mode.
set -euo pipefail
# ... Run whatever commands ...
# echo "conda activate MAPLE_py36" >> /home/$USERNAME/.bashrc

# Temporarily disable strict mode and activate conda:
set +euo pipefail
# conda activate MAPLE_py36

# show packages
# conda list

# install h5py
# conda install pip
# pip install --upgrade pip
# pip install h5py
# conda install -c conda-forge h5py

ls
which python

# Re-enable strict mode:
# set -euo pipefail

# exec the final command:
exec python run.py

# exec python maple_workflow.py