For the Local Ancestry Inference Proof of Concept we are only using Chr19 (as that is the main chromosome of interest for AD)

Find the Gnomix main github here: https://github.com/AI-sandbox/gnomix

**NOTE: Gnomix requires a LARGE amount of Ram make sure you have a computer, cluster or VM with at least 120GB if you are going to run analysis with samples in the thousands.**
For our case with all the participants and 120GB the ALFA study (larger of the two) was 2483 participants took 67GB of Ram to analyze Chr19 (more for the larger chormosomes) with the Phasing turned on (mandatory for this pipeline) running Gnomix with the pretrained model took about 5 hours on my large VM of 120GB capacity. (Check your capacity with command: lscpu in bash).

lscpu        # Shows detailed information about the CPU
free -h      # Shows information about memory usage

You can split and run each files seperately and merge before the next step (but not recommended or done in this analysis). 

After Running the files through TOPMed Imputation Server or another imputation and phasing system you will need to either use the Gnomix pretrained models (where you do not need reference files)
If using the default model provided by Gnomix test first with chr22 and see that you have AT LEAST 80% in the Percentage of model SNPs covered by query file.

This is an Example of a FAILED Gnomix analysis - with **ONLY 0.25% SNPs covered in the query file this gives very inaccurate results!!!**
![image](https://github.com/user-attachments/assets/48e48aba-40b0-47ca-ab92-f5dfe3ed79ba)

**Make sure your snpIDs are consistent with the reference panel/ model!**

Using default pretrained model (no need for references). Note you need to run this for each chromosome of your data. 
$ python3 gnomix.py <query_file> <output_folder> <chr_nr> <phase> <path_to_model> 

**Note for this pipeline you MUST have <phase> as TRUE as you will need the vcf file to be able to continue with TractoR.**

As I had little success with the refernce SNPs in the pretrained models (low SNP coverage in the query file) we decided to restart and take our array data (Had been QCed in plink (see TOPMed README file) and made into .bed, .bim, .fam files, then transformed into vcf files per choromosome in order to upload, but otherwise raw) and reran through TOPMed Imputation Server, to get the raw SNPIDs, then with an email to 	topmed.omics@umich.edu to attain the reference file, genetic map file, and sample map file. 

Using the training file

$ python3 gnomix.py <query_file> <output_folder> <chr_nr> <phase> <genetic_map_file> <reference_file> <sample_map_file>

**Note: To get the reference file, the genetic map file, and the sample file, it is best to contact or find the files you used with the Imputation Server, and make sure to make NO CHANGES to the SNPIDs in your post imputation vcf files.**

