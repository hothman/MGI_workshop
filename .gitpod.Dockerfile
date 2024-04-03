FROM ubuntu:latest 

RUN apt-get update

RUN apt-get install wget -y

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O miniforge.sh && \
    bash miniforge.sh -b -p /opt/miniforge && \
    rm miniforge.sh

# Add Miniconda to the PATH environment variable
ENV PATH="/opt/miniforge/bin:${PATH}"

#vim
RUN  apt-get -y  update &&  apt-get install -y  vim
RUN apt-get install -y git 
# Verify installation
RUN conda --version

# Add channels to install from
RUN conda config --add channels bioconda 
RUN conda config --add channels conda-forge

RUN mamba install samtools -y 
