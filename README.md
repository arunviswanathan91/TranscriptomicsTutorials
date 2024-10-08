# TCGA Data Retrieval Tutorial

This repository contains an R script for retrieving and processing transcriptomics data from The Cancer Genome Atlas (TCGA) using the TCGAbiolinks package. It's designed as a tutorial for PhD students and researchers new to working with TCGA data.

## Prerequisites

Before running this script, ensure you have R installed on your system. You'll also need to install the following R packages:

- BiocManager
- TCGAbiolinks
- SummarizedExperiment

## Installation

1. Clone this repository to your local machine:
   ```
   git clone https://github.com/yourusername/tcga-data-retrieval-tutorial.git
   ```
2. Open R or RStudio and set your working directory to the cloned repository.

## Usage

1. Open the `tcga_data_retrieval.R` script in your R environment.

2. Modify the `setwd()` function at the beginning of the script to set your desired working directory:
   ```R
   setwd("C:/users/your/preferred/directory")
   ```

3. Run the script step by step or all at once. The script will:
   - Install and load necessary packages
   - Define sample barcodes
   - Query and download data from TCGA
   - Process the data
   - Save the data as a CSV file
   - Perform basic data exploration

## Script Overview

The script is divided into several steps:

1. **Install and load packages**: Sets up the necessary R packages.
2. **Define barcodes**: Specifies the sample barcodes for data retrieval.
3. **Query the GDC database**: Sets up the data query.
4. **Download the data**: Retrieves the specified data from TCGA.
5. **Prepare the data**: Processes the downloaded data.
6. **Save data as CSV**: Exports the processed data to a CSV file.
7. **Read CSV file**: Demonstrates how to import the saved data.
8. **Basic data exploration**: Performs initial analysis on the imported data.

## Output

The script will generate a CSV file named `Transcriptomicsdata.csv` in your working directory. This file contains the gene expression data for the specified samples.

## Notes

- Make sure to adjust file paths according to your system's directory structure.
- The sample barcodes provided are examples. Replace them with the specific barcodes relevant to your research.
- This script is intended as a starting point. Feel free to modify and expand it to suit your specific research needs.

