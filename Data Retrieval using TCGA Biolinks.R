# TCGA Data Retrieval Tutorial 
# This script demonstrates how to retrieve TCGA data, save it as a CSV file, and read it back in for analysis.


# Step 1: Install and load necessary packages
#############################################
#Set working Directory
setwd("C:/users/........") #define a path you want to save all your files.

# Install BiocManager if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Install Bioconductor and TCGAbiolinks
BiocManager::install()
BiocManager::install("TCGAbiolinks")

# Load necessary libraries
library(TCGAbiolinks)
library(SummarizedExperiment)

# Step 2: Define the barcodes of ecah patient sample
####################################################

barcodes <- c(
  "CPT0209640011", "CPT0065570006", "CPT0139000007", "CPT0247090013", "CPT0238040011",
  "CPT0078090010", "CPT0124410010", "CPT0124360009", "CPT0162660010", "CPT0208690010",
  "CPT0123990006", "CPT0093860006", "CPT0064520007", "CPT0094130007", "CPT0094030006",
  "CPT0236700011", "CPT0208840010", "CPT0161990011", "CPT0161770010", "CPT0081470010",
  "CPT0123750009", "CPT0126160007", "CPT0088180007", "CPT0109110007", "CPT0019300007",
  "CPT0124980010", "CPT0093930007", "CPT0124500010", "CPT0183750011", "CPT0011520009",
  "CPT0248590014", "CPT0247040006", "CPT0246210007", "CPT0226570010", "CPT0238820011",
  "CPT0237910010", "CPT0237840010", "CPT0197420010", "CPT0207780007", "CPT0264150006",
  "CPT0246840013", "CPT0254680009", "CPT0238710010", "CPT0209310014", "CPT0276010009",
  "CPT0166650012", "CPT0226680011", "CPT0198700011", "CPT0236560010", "CPT0183450011",
  "CPT0236780011"
)

# Step 3: Query the GDC database
################################

query <- GDCquery(
  project = "CPTAC-3",
  data.category = "Transcriptome Profiling",
  data.type = "Gene Expression Quantification",
  workflow.type = "STAR - Counts",
  barcode = barcodes
)

# Step 4: Download the data
###########################

GDCdownload(query)

# Step 5: Prepare the data
##########################

data <- GDCprepare(query)

# Step 6: Save the data as a CSV file
#####################################

# Extract the "unstranded" assay and write it to a CSV file
write.csv(assay(data, "unstranded"), file = "Transcriptomicsdata.csv", row.names = TRUE)

# Step 7: Read the CSV file back into R
#######################################

# Read the CSV file
imported_data <- read.csv("Transcriptomicsdata.csv")

# Print the dimensions of the imported data
print(paste("Dimensions of imported data:", nrow(imported_data), "rows and", ncol(imported_data), "columns"))

# Print the first few rows of the imported data
print("First few rows of the imported data:")
print(head(imported_data))

# Step 8: Basic data exploration
################################

# Get summary statistics
print("Summary statistics of the first few columns:")
print(summary(imported_data[, 1:5]))

# Calculate the mean expression across all samples
mean_expression <- rowMeans(imported_data)

# Identify the top 10 highly expressed genes
top_genes <- head(sort(mean_expression, decreasing = TRUE), 10)
print("Top 10 highly expressed genes:")
print(top_genes)

# Note: change the paths according to your directory structure. 