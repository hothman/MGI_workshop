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

# install R tools
RUN mamba create -n mgi_alif r-base=4.1.3  r-tibble=3.2.1 bioconductor-dada2=1.22.0 \
  bioconductor-phyloseq=1.38.0 r-readxl=1.4.2 r-ggplot2 r-cowplot=1.1.1 \
  r-patchwork bioconductor-microbiotaprocess=1.6.1 r-rcolorbrewer r-recommended 
#  r-irkernel -y
ENV DEBIAN_FRONTEND=noninteractive
# 
#RUN apt-get install r-base -y



# install rstudio-server
RUN apt-get install gdebi-core -y
RUN wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.12.1-402-amd64.deb
RUN gdebi -n rstudio-server-2023.12.1-402-amd64.deb
RUN  echo "rsession-which-r=/opt/miniforge/envs/mgi_alif/bin/R" >> /etc/rstudio/rserver.conf
# install jupyter lab
#RUN pip install jupyterlab
#RUN pip install pandas matplotlib
#RUN R -e 'IRkernel::installspec()' 

