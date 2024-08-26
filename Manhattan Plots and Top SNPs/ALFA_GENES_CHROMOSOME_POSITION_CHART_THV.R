# Load necessary libraries
library(biomaRt)
library(ggplot2)
library(dplyr)

# Set up Ensembl connection
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

# List of SNP coordinates and their respective ancestries
ancestries <- c(
  rep("EUR", 10),
  rep("NAT", 10),
  rep("AFR", 10),
  rep("AHG", 10),
  rep("WAS", 10),
  rep("PCA", 10),
  rep("GA", 10)
)

snps <- c(
  "19:10188210", "19:35745099", "19:29406112", "19:32813784", "19:10934453", "19:32726461", "19:32705738", "19:18125871", "19:28504455", "19:53084716",
  "19:39121535", "19:29126636", "19:41165486", "19:28886256", "19:28336979", "19:39090097", "19:29109439", "19:38313578", "19:27863787", "19:27787912",
  "19:455993", "19:45657380", "19:45525676", "19:50396467", "19:58284108", "19:840448", "19:45527153", "19:841100", "19:378150", "19:448342",
  "19:12443647", "19:12412984", "19:9274398", "19:7850791", "19:45660511", "19:7846094", "19:39870472", "19:45255106", "19:15976479", "19:56714741",
  "19:24284577", "19:48219924", "19:21652268", "19:23645699", "19:24300660", "19:55380670", "19:22686570", "19:21754770", "19:28177133", "19:23652599",
  "19:9115864", "19:14651727", "19:9116294", "19:9116401", "19:9116564", "19:14673530", "19:9116997", "19:9115516", "19:14672495", "19:14649127",
  "19:9115864", "19:14651727", "19:14673530", "19:14672495", "19:14649127", "19:14651344", "19:14651738", "19:14662210", "19:9116294", "19:9116401"
)



# Split coordinates into chromosome and position
coords <- do.call(rbind, strsplit(snps, ":"))
chromosomes <- coords[, 1]
positions <- as.numeric(coords[, 2])

# Query Ensembl for each SNP
results <- data.frame()
for (i in 1:length(snps)) {
  res <- getBM(
    attributes = c('chromosome_name', 'start_position', 'end_position', 'external_gene_name'),
    filters = c('chromosome_name', 'start'),
    values = list(chromosomes[i], positions[i]),
    mart = ensembl
  )
  res$Ancestry <- ancestries[i]
  res$Position <- positions[i]
  results <- rbind(results, res)
}

# Prepare data for visualization
results <- results %>% mutate(Ancestry = factor(Ancestry, levels = unique(ancestries)))

# Define APOE region
apoe_start <- 45409053
apoe_end <- 45412650

# Plotting
ggplot(results, aes(x = Position, y = Ancestry, color = Ancestry)) +
  geom_point() +
  geom_rect(aes(xmin = apoe_start, xmax = apoe_end, ymin = -Inf, ymax = Inf),
            fill = "gray", alpha = 0.5) +
  theme_minimal() +
  labs(title = "Chromosome Positions per Ancestry ALFA THV", x = "Chromosome Position", y = "Ancestry") +
  theme(legend.position = "none")

