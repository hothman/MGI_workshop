# Reproducibility in bioinformatics

Ensuring reproducibility in bioinformatics is a continuous process through all the life cycles of the research project and involves many collaborators. This tutorial will walk you through different available tools that you can use to operate in a reproducible research-friendly environment.

We will cover the following concepts, that you should be familiar with at the end of the practical: 
* Best Practices for reproducible research
* Best practices for data sharing
* Working tidily in bioinformatics projects
* The importance of coding in reproducible bioinformatics
* The Markdown language for project notebooks
* The version control system
* Literate programming paradigm

## Basic concepts and tools for reproducible research in bioinformatics
### Working tidy in a bioinformatics project
A typical computational biology project would use scripts and data to answer a research question. Although data sharing is recommended in the research field as we discussed previously, there might be ethical/legal issues that prevent that. Therefore you do not want to accidentally share or harm your data when the project becomes large and everything becomes messy. 
It is highly recommended in a bioinformatics project to separate data from the rest of the components like codes, plots and documentation. When needing to use data, you can then call them from any script using their relative paths.

Within the root directory, create three subdirectories,  `scripts_HX`, `data_HX`, and `analysis_HX`

```{sh}
mkdir scripts_HX data_HX analysis_HX 
```

Noting that these subdirectories may contain other directories. For instance, if you use bash scripts and python scripts in your project, you may create two subdirectories within the `scripts_HX` directory to keep things tidy.  

```
mkdir scripts_HX/bash scripts_HX/python
```

Arguably the most important file in the directory project is the \verb!README.md!. 

```
touch README.md 
```

Write a small bash script `download_chX.sh` that automates the download to the `data_HX` directory. Naturally, the code should be run from the `scripts_HX` directory. In the header of the script, label it as version (v1).

### The Markdown language for project notebooks
Comments are intended to facilitate the readability of the code but they are no substitutes for the natural language. A word processor is not convenient in this case because we need to combine different sources of information including texts, codes, links, and figures while at the same time preserving the interoperability of your notebook and sometimes the deployment of its content. 
We will use the markdown language to describe the chronology of your work.

Run the [Jupyter Onlins](https://jupyter.org/try) and start rendering in Markdown language. Start describing the relevant information of your raw files by providing the following information:


* Add a title to your notebook. Titles are rendered after the \verb!"#"! character followed by a space.
* Which version and patch of the genome assembly have you used to download the sequence of the chromosome X?
* Give the link of each downloaded file. Links are rendered according to the following schema `[Jhon Doe](www.tales.org)`
* Give the version of the software used to download the data.
* The path to the script `download_chX.sh` and its version. Inline plain text is written between two "back quotes" characters ! (This is not the single quote character.
* Insert the same code you have written in a block of plain non rendered text. Blocks are put between two series of triple back quotes. 

```
# Displaying the content of a file 
cat foo
```
 
For some reason, you need a G-banding ideogram. Link to images is rendered using the schema `[tagging text](Url or path to the figure) `

There isn't really a golden rule on how to annotate your bioinformatics project. However, the key point is to include all the information that would allow reproducing the same results using the same tools and the same dataset by any user.

## Managing virtual environments with conda/mamba
A large time in a bioinformatic project is reserved for testing tools, pipelines, and algorithms to run analysis. This implies that the deployed computational environment can be complex hard to reproduce. To overcome the problem some different techniques and methods can be used, each has its advantages and drawbacks. The idea is almost the same, isolating the computational environment from the rest of the components of the operating system and keep a record of its components to use in case of reproducing the analysis pipeline.  Perhaps the least complex of these methods is the employment of virtual environments where the user can test install and test several components without the requirement to process the superuser privileges. Conda can be operated to manage virtual environments.


First, we will create an isolated virtual environment called mgi-2024 using conda and then we will activate it. \\

```
(base) $ mamba create --name mgi-2024
(base) $ conda activate mgi-2024
```

Next, we will install some bioinformatics tools in the created virtual environment. Conda handles packages via channels. Channels are remote repositories where packages are stores. There are plenty of conda packages. The most important ones are the default, the anaconda channel, and the conda forge channel. The one that we are interested in is bioconda that was created to normalize and facilitate the usage of bioinformatics tools. First, we want to search for samtools from bioconda and install version 0.10.1.  

```
$ mgi-2024 mamba search -c bioconda samtools
$ (mgi-2024) mamba install -c bioconda -y samtools=0.1.19
```

Finally, after installing all the dependencies, we want to export the information that will allow us to reproduce the same computational environment. Within the mgi-2024 environment type.

```
(mgi-2024) $ mamba env export > mgi-2024.yml
```

If we wish to re-create the environment on another machine we can just use the YML file as follows: 

```
(base) $ mamba env create -f  mgi-2024.yml 
```

### Generate plots behind codes and the Literate Programming Paradigm

Let's do this practical, "the modern way". 
Write a python script that reads a FASTA file and plots the distribution of GC in a plot. 


