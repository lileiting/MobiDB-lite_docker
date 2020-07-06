# Use Ubuntu 18.04 LTS as base image
FROM ubuntu:18.04

# Set working directory
WORKDIR /usr/src/mobidb

# Make tests directory
RUN mkdir ./test
# Copy test notebook into remote test folder
COPY ./test.ipynb ./test/test.ipynb
# Copy data folder into remote test folder
COPY ./data ./test/data

# Install python
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.7 python3-pip python3-setuptools python3-wheel \
    python2.7 python-pip \
    git && \
    apt-get clean  && \
    apt-get autoremove

# Install required python packages
RUN pip3 install wheel numpy notebook matplotlib tqdm

# Retrieve remote mobidb folder
RUN git clone https://github.com/ebi-pf-team/interproscan && \
    mv ./interproscan/core/jms-implementation/support-mini-x86-32/bin/mobidb/2.0/* ./ && \  # Uncomment for version 2.0
#     mv ./interproscan/core/jms-implementation/support-mini-x86-32/bin/mobidb/1.5/* ./ && \  # Uncomment for version 1.5
#     mv ./interproscan/core/jms-implementation/support-mini-x86-32/bin/mobidb/1.0/* ./ && \  # Uncomment for version 1.0
    mv ./interproscan/core/jms-implementation/src/test/resources/data/mobidb/1.0/test_mobidb_seqs.fasta  ./test/sequences.fasta && \
    rm -r ./interproscan

# # Retrieve local mobidb folder
# COPY path/to/mobidb ./

# Instantiate new notebook
CMD /bin/bash -c "jupyter notebook --ip='*' --port=8888 --no-browser --allow-root ./test/test.ipynb"
