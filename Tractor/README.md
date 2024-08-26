For tractor we used the two main (non optional) steps as explained in the tutorial. As we had already done our phasing with Gnomix and the TOPMed Server.

Our first step was to Extract the Ancestry Tracts to get the Dosage and the Haplotype count files as described here:
https://github.com/Atkinson-Lab/Tractor/wiki/Step-2:-Extracting-tracts-and-ancestral-dosages
Using this code in bash:

```bash python ExtractTracts.py --msp MSP_FILE --vcf VCF_FILE --num-ancs 8 ```

For our --num-ancs we set this to 8 as the default setting is 8 for the number of ancestries from gnomix default pretrained models:
EUR=0: European ancestry is coded as 0
EAS=1: East Asian ancestry is coded as 1
NAT=2: Native American ancestry is coded as 2
AFR=3: African ancestry is coded as 3
SAS=4: South Asian ancestry is coded as 4
AHG=5: Ancestral Human Genome is coded as 5
OCE=6: Oceanian ancestry is coded as 6
WAS=7: West Asian ancestry is coded as 7

So if you are using this pipeline with the Gnomix pretrained modesl use --num-ancs = 8

If you are using a customized Reference Panel then use the number of ancestries in said panel and more importantly sample mapping file, where you set the ancestries.




