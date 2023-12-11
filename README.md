# Miller Lab Hellgate HPC Programs

## Creating Containers and Installing Programs

Hellgate uses Apptainer (which uses Singularity) to manage programs within containers. This allows you to install programs that require sudo permissions, etc. as well as control between versions of programs. Best/preferred practices from CIQ (company that helped UMT set up Hellgate) is to put individual programs in their own container, but you don't have to do this.

### To install programs that have a docker image available:

Generally, installation is very easy if there is a docker image already available on [Docker Hub](https://hub.docker.com/). Two particularly useful groups are [staphb](https://hub.docker.com/u/staphb) and [biocontainers](https://hub.docker.com/u/biocontainers).

`apptainer pull <name_for_container.sif> docker://<DOCKER_HUB_PATH>`

### To install program that doesn't have a docker image/with a .def file:

To install program that doesn't have a docker image, you'll need to create your own .def file. Hopefully you won't need to, but apptainer has pretty good documentation on this as well as the Hellgate CIQ training videos, and Hellgate support people can help. Once it's built, you can build a container via the following:

`apptainer build <name_for_container.sif> <def_file.def>`

