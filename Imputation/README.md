Overall for imputation I would recommend using Minimac with your customized reference panel for this pipeline rather than a imputation server if you are not using a group with 3 level admixture (multicultural backgrounds or mixed groups). Make sure that if you are using TOPMed, Michigan or a different reference panel that you have that reference panel available. If you use Minimac, you will then need to use a phaseing tool such as Eagle, Beagle, or Shapeit to phase the tools. 

Below are the settings we used for our imputation with the Michigan Imputation for the ALFA (and ADNI) groups. We then utalized the default Gnomix pretrained models, which use a derivative of the 1000Genomes Reference Panel, Genetic Map, and Sample Map, so that those do not need to be used in the Gnomix LAI stage.

![image](https://github.com/user-attachments/assets/b9999ee5-dcda-452c-b3a1-9fd888c3fb74)
