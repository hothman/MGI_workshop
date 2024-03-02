FROM ubuntu:latest 

RUN apt-get update

RUN apt-get install wget -y

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /opt/miniconda && \
    rm miniconda.sh

# Add Miniconda to the PATH environment variable
ENV PATH="/opt/miniconda/bin:${PATH}"

# Verify installation
RUN conda --version

# Add channels to install from
RUN conda config --add channels bioconda 
RUN conda config --add channels conda-forge
