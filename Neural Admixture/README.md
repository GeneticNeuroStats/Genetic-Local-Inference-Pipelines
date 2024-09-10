For Neural Admixture the following github README and code was used:
https://github.com/AI-sandbox/neural-admixture

### Training Neural-Admixture Model

To train the Neural-Admixture model with `k=4`, use the following command:

```bash
neural-admixture train --k 4 --path_to_file/ALFA.bed --save_dir  path_to_file/NEURAL_ADMIXTURE_OUTPUTS/ --name ALFA_k4 --seed 42

Here you require a bed file for your input data, a cluster number (k), a directory to save the file (--save_dir), the name of the output file (--name), and a seed (--seed)

For the cluster it is easiest to guess and visulize (see R code below, you will use the .Q output file from Neural Admixture for this). I started with k=8 to see how the clusters compared to the 8 genetic ancestries given in the Gnomix pretrained model

```R
library(popkin)

Q <- read.table("path_to_file/ALFA_19_4B.4.Q", header = TRUE)
 dim(Q)
 plot_admix(Q)

 library(ggplot2)
 pca_result <- prcomp(Q, scale. = TRUE)
 
 pca_data <- data.frame(pca_result$x)
 pca_data$cluster <- max.col(Q)  # Assign each sample to the cluster with the highest probability

 ggplot(pca_data, aes(x = PC1, y = PC2, color = as.factor(cluster))) + 
   geom_point() +
   theme_minimal() +
   labs(title = "PCA Plot", x = "Principal Component 1", y = "Principal Component 2", color = "Cluster")

![image](https://github.com/user-attachments/assets/5a98cd5d-84ba-4cce-b3f9-55c585e410ee)

 
