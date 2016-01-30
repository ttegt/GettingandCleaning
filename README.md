# Getting and Cleaning Data Project Repository
This repository contains files related to the course project for Getting and Cleaning Data. The data were collected from Samsung smartphones worn by individuals performing six different activities. Details of the experiment can be found in the codebook as well as the source files.

## Contents
In addition to this README.md file, this repo contains the following files.


### run_analysis.R

This R script performs the requested operations on the Samsung data sets. It

* Assumes the UCI HAR Dataset folder is in the working directory.
* Merges the training and test files from the above folder, and produces two data sets, merged1 and samsung.
* Writes those data sets to the files merged1.txt and samsung.txt, respectively.


### codebook.md

The codebook, describing the processing and variables involved.