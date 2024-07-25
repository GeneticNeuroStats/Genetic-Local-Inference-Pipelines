Once you have your idad files from you sample arrays and have been able to convert these to PLINK files (bed, bim, fam) then we suggest you run some basic PLINK QC (https://www.cog-genomics.org/plink/1.9/input).
For our QC we ran Sample QC sex discordance, missing genotypes of 10%, Relatedness cutoff of 18.5% or higher. We also ran SNP QC with MAF >0.01 and HWE pvaule <10-6, and a call rate of > 90% (missing <10%).
![image](https://github.com/user-attachments/assets/fae46096-220f-4e24-b2cf-750fe69bb777)


![TopMed SupplementalFigure1](https://github.com/user-attachments/assets/9566ad6d-a718-409a-b027-6239c0f36542)

Once we had the QCed PLINK files, we ran code to split the bed files into vcf per chromosome and ran it in the TOPMed Imputation Server

####ADD screenshot here



#### Move and later
![LAI Pipeline SupplementalFigure2](https://github.com/user-attachments/assets/3d20e1fc-b2f7-4468-ab7e-a6704d0a8b15)
