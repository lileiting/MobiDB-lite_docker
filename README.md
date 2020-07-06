# mobidb_lite_docker
Dockerfile for creating an image containing a fully working MobiDB Lite release, according to the latest available in Interproscan public repository

# How it works
The Dockerfile automatically creating an Ubuntu 18.04 image with Python 2 and 3 either, both required to run MobiDB Lite with default parameters:

`python3 mobidb_liste.py -f 0 test/sequences.fasta`

where `sequences.fasta` is a multi-fasta file containing a few sequences, used to assess if scripts are working or not.

Files are downloaded from EMBL-EBI's public Interproscan repository, hence not provided within this repository. After having downloaded the full repository, most of the file except for `mobidb/<version>` and dependencies folders are removed. Note that downloading process could take a few minutes, depending to connection and network capabilities.

# Sources

It is possible to retrieve source code by either downloading it from Interporscan openly accessible GitHub repository, which is the default function, carried out automatically by the Dockerfile while building the relative image.

Otherwise, it is possible to build the image starting from a local version of MobiDB Lite by commenting out the lines right under `# Retrieve remote mobidb folder` comment, while removing the comment from the lines just below `# Retrieve local mobidb folder` comment. This last option has been used while retrieving 2020's version of the program.

# Branches

## Main
In the main branch of this repository some test are provided, running in Python 3, hence fully compatible with MobiDB Lite environment. Tests try to figure out if dependencies are correctly satisfied in the generated image and how these performs, expecially with respect to multithreading related parameters.

Moreover, benchmarks are provided with respect to some parameters, such as number of threads involved in MobiDB Lite predictor. Benchmarks are accessible as a Jupyter Notbeook by running the container, based on the Dockerfile's image, with the following command:

`docker run -p 8888:8888 -it --name mdb mobidb:2.0.0`

which, given that build image's name is `mobidb_lite:2.0.0`, will provide a link accessible from a web browser on the user's local machine.

## Minimal
This branch provides a Dockerfile for buolding the same image but installs only the main files and discards, instead, all the testing and benchmarking stuff.
