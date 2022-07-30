# MAPLE-NGC
Running MAPLE code in a Nvidia NGC Singularity/Apptainer container for HPC. 

To build: `docker build -t kastanday/ngc_tf1:mini .`

To push: `docker push kastanday/ngc_tf1:mini`

* `mini` -- for prod. Only necessities. 
* `latest` -- for testing. 


To build singularity: `apptainer pull docker://kastanday/ngc_tf1:mini`

Good luck!
