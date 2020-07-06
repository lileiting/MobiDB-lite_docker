# Use Ubuntu 18.04 LTS as base image
FROM ubuntu:18.04

# Set working directory
WORKDIR /usr/src/mobidb

# Install python
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.7 python3-pip \
    python2.7 python-pip \
    git && \
    apt-get clean  && \
    apt-get autoremove

# Install required python packages
RUN pip3 install numpy

# # Retrieve remote mobidb folder (from Interproscan repository)
# RUN git clone https://github.com/ebi-pf-team/interproscan && \
#     mv ./interproscan/core/jms-implementation/support-mini-x86-32/bin/mobidb/2.0/* ./ && \  # Uncomment for version 2.0
# #     mv ./interproscan/core/jms-implementation/support-mini-x86-32/bin/mobidb/1.5/* ./ && \  # Uncomment for version 1.5
# #     mv ./interproscan/core/jms-implementation/support-mini-x86-32/bin/mobidb/1.0/* ./ && \  # Uncomment for version 1.0
#     mv ./interproscan/core/jms-implementation/src/test/resources/data/mobidb/1.0/test_mobidb_seqs.fasta  ./test/sequences.fasta && \
#     rm -r ./interproscan

# Retrieve remove mobidb folder (from MobiDB Lite repository)
RUN git clone https://github.com/BioComputingUP/MobiDB-lite.git && \
    mv ./MobiDB-lite/* ./ && \
    rm -r ./MobiDB-lite

# # Retrieve local mobidb folder
# COPY path/to/mobidb ./
