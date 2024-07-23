# LAIPipeline
Local Ancestry Inference Pipeline for LAI enriched GWAS

This is the Proof of Concept for the testing of a Local Ancesty Inference (LAI) Pipeline to track the effect of ancestry on GWAS analysis of Alzheimer´s Disease (AD). As a Proof of Concept this study will only focus on the SNPs of import from Chr19 (specifically the area of APOE - the most noted gene in AD research).

The project is split into 4 models with two cohorts: ALFA and ADNI, and two independent variables: Total Hippocampal Volume (TIV), and Amyloid Beta 42 Levels (AB). Each of the Cohorts and independent variable models will go through three analyses: A basic full GWAS, a GWAS enriched with Global Ancestry (GA) PCA clusters, and a GWAS enriched with LAI data. See the chart below for a summary: 

|        | Full GWAS | GWAS with GA focus on Chr 19 | GWAS with LAI focus on Chr 19 |
|--------|----------|----------|----------|
| ALFA w THV |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram   |Top Chr 19 SNPs of Interest, Bar Chart of Ancestries, Manhattan Plots per Ancestry, PCA Diagram |
| ALFA w AB |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram   |Top Chr 19 SNPs of Interest, Bar Chart of Ancestries, Manhattan Plots per Ancestry, PCA Diagram |
| ADNI w THV |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram   |Top Chr 19 SNPs of Interest, Bar Chart of Ancestries, Manhattan Plots per Ancestry, PCA Diagram |
| ADNI w AB |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram |Top Chr 19 SNPs of Interest, Manhattan Plot, PCA Diagram   |Top Chr 19 SNPs of Interest, Bar Chart of Ancestries, Manhattan Plots per Ancestry, PCA Diagram |

The main LAI pipeline will focus on the use of the tools TOPMed Imputation Server (https://imputation.biodatacatalyst.nhlbi.nih.gov/), Gnomix (https://github.com/AI-sandbox/gnomix), and TractoR (https://github.com/Atkinson-Lab/Tractor), and analysis with various tools and packages in R (can see more detail in the R code).

The Global Ancestry (GA) Pipeline will be similar using Neural Admixture, also by the labs at Stanford and key creators from Gnomix (https://github.com/AI-sandbox/neural-admixture) and NOT using TractoR.
