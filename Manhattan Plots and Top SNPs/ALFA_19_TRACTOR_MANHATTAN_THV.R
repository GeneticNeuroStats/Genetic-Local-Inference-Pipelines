library(qqman)

# Set working directory
setwd("~/files/ALFA/Archive/ALFA_TRACTOR_OUTPUTS")

# Read the data file
sumstats <- read.delim("ALFA_19_TRACTOR_THV_v2.txt", sep = "\t")

# Check the column names
print(colnames(sumstats))

# Convert p-value columns to numeric
sumstats$pval_anc0 <- as.numeric(sumstats$pval_anc0)
sumstats$pval_anc1 <- as.numeric(sumstats$pval_anc1)
sumstats$pval_anc2 <- as.numeric(sumstats$pval_anc2)
sumstats$pval_anc3 <- as.numeric(sumstats$pval_anc3)
sumstats$pval_anc4 <- as.numeric(sumstats$pval_anc4)
sumstats$pval_anc5 <- as.numeric(sumstats$pval_anc5)
sumstats$pval_anc6 <- as.numeric(sumstats$pval_anc6)
sumstats$pval_anc7 <- as.numeric(sumstats$pval_anc7)

# Filter out rows with NA p-values
sumstats_anc0 <- sumstats[!is.na(sumstats$pval_anc0),]
sumstats_anc1 <- sumstats[!is.na(sumstats$pval_anc1),]
sumstats_anc2 <- sumstats[!is.na(sumstats$pval_anc2),]
sumstats_anc3 <- sumstats[!is.na(sumstats$pval_anc3),]
sumstats_anc4 <- sumstats[!is.na(sumstats$pval_anc4),]
sumstats_anc5 <- sumstats[!is.na(sumstats$pval_anc5),]
sumstats_anc6 <- sumstats[!is.na(sumstats$pval_anc6),]
sumstats_anc7 <- sumstats[!is.na(sumstats$pval_anc7),]

# Set up the plotting area
par(mfrow=c(1,4))

# Manhattan plot for each pval_anc0
manhattan(sumstats_anc0, 
          chr="CHR", 
          bp="POS", 
          snp="ID", 
          p="pval_anc0",
          xlim = c(min(sumstats_anc0$POS), max(sumstats_anc0$POS)), 
          ylim = c(0, 8), 
          main = "EUR",
          annotatePval = 2,
          suggestiveline = -log10(1e-02),
          genomewideline = -log10(5e-04),
          highlight = TRUE,
          logp = TRUE,
          annotateTop = TRUE)


#manhattan(sumstats_anc1, 
 #         chr="CHR", 
  #        bp="POS", 
   #       snp="ID", 
    #      p="pval_anc1",
     #     xlim = c(min(sumstats_anc1$POS), max(sumstats_anc1$POS)), 
      #    ylim = c(0, 15), 
       #   main = "EAS")

~manhattan(sumstats_anc2, 
          chr="CHR", 
          bp="POS", 
          snp="ID", 
          p="pval_anc2",
          xlim = c(min(sumstats_anc2$POS), max(sumstats_anc2$POS)), 
          ylim = c(0, 8), 
          main = "NAT",
          annotatePval = 2,
          suggestiveline = -log10(1e-02),
          genomewideline = -log10(5e-04),
          highlight = TRUE,
          logp = TRUE,
          annotateTop = TRUE)


manhattan(sumstats_anc3, 
          chr="CHR", 
          bp="POS", 
          snp="ID", 
          p="pval_anc3",
          xlim = c(min(sumstats_anc3$POS), max(sumstats_anc3$POS)), 
          ylim = c(0, 8), 
          main = "AFR",
          annotatePval = 2,
          suggestiveline = -log10(1e-02),
          genomewideline = -log10(5e-04),
          highlight = TRUE,
          logp = TRUE,
          annotateTop = TRUE)


#manhattan(sumstats_anc4, 
 #         chr="CHR", 
  #        bp="POS", 
   #       snp="ID", 
    #      p="pval_anc4",
     #     xlim = c(min(sumstats_anc4$POS), max(sumstats_anc4$POS)), 
      #    ylim = c(0, 8), 
       #   main = "SAS",
        #  annotatePval = 6)

manhattan(sumstats_anc5, 
          chr="CHR", 
          bp="POS", 
          snp="ID", 
          p="pval_anc5",
          xlim = c(min(sumstats_anc5$POS), max(sumstats_anc5$POS)), 
          ylim = c(0, 8), 
          main = "AHG",
          annotatePval = -log10(1e-02),
          suggestiveline = -log10(1e-02),
          genomewideline = -log10(5e-04))


#manhattan(sumstats_anc6, 
 #         chr="CHR", 
  #        bp="POS", 
   #       snp="ID", 
    #      p="pval_anc6",
     #     xlim = c(min(sumstats_anc6$POS), max(sumstats_anc6$POS)), 
      #    ylim = c(0, 15), 
       #   main = "OCE",
        #  annotatePval = 6)

manhattan(sumstats_anc7, 
          chr="CHR", 
          bp="POS", 
          snp="ID", 
          p="pval_anc7",
          xlim = c(min(sumstats_anc7$POS), max(sumstats_anc7$POS)), 
          ylim = c(0, 8), 
          main = "WAS",
          annotatePval = 2,
          suggestiveline = -log10(1e-02),
          genomewideline = -log10(5e-04),
          highlight = TRUE,
          logp = TRUE,
          annotateTop = TRUE)

library(dplyr)
library(tidyr)

# Function to count non-blank and non-zero values
count_non_blank_non_zero <- function(x) {
  sum(!is.na(x) & x != 0)
}

# Create the pivot table by counting non-blank and non-zero entries for each ancestry
pivot_table <- sumstats %>%
  summarise(
    EUR = as.numeric(count_non_blank_non_zero(LAprop_anc0)),
    EAS = as.numeric(count_non_blank_non_zero(LAprop_anc1)),
    NAT = as.numeric(count_non_blank_non_zero(LAprop_anc2)),
    AFR = as.numeric(count_non_blank_non_zero(LAprop_anc3)),
    SAS = as.numeric(count_non_blank_non_zero(LAprop_anc4)),
    AHG = as.numeric(count_non_blank_non_zero(LAprop_anc5)),
    OCE = as.numeric(count_non_blank_non_zero(LAprop_anc6)),
    WAS = as.numeric(count_non_blank_non_zero(LAprop_anc7))
  )

# Display the pivot table# Display the pivot table
print(pivot_table)

library(ggplot2)

# Convert the pivot table to a long format for ggplot2
pivot_table <- pivot_table %>%
  pivot_longer(cols = everything(), names_to = "Ancestry", values_to = "Count")


watercolor_tones <- c("#1B4F72", "#2874A1", "#1F808D", "#1D8348", "#28B450", "#239B95", "#7D3C50", "#6C3483")


# Create the bar chart with watercolor tones
ggplot(pivot_table, aes(x = Ancestry, y = Count, fill = Ancestry)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = watercolor_tones) +
  labs(title = "SNPs per Ancestry of ALFA Chr 19", x = "Ancestry", y = "Count of SNPs") +
  theme_minimal()


#Top values

# Load necessary library
library(dplyr)

# Read the data
file_path <- "~/files/ALFA/Archive/ALFA_TRACTOR_OUTPUTS/ALFA_19_TRACTOR_THV_v2.txt"
data <- read.table(file_path, header = TRUE, sep = "\t", na.strings = "")

# Filter out columns with all NA values
filtered_data <- data[, colSums(is.na(data)) < nrow(data)]

# Extract 'ID' and p-value columns
pval_columns <- grep("pval_anc", names(filtered_data), value = TRUE)
result_data <- filtered_data %>% select(ID, all_of(pval_columns))

# Function to get top 10 SNPs for a specific pval_anc column
get_top_snps <- function(df, pval_col) {
  df %>% arrange_at(vars(pval_col)) %>% filter(!is.na(!!sym(pval_col))) %>% slice(1:10) %>% select(ID)
}

# Get top 10 SNPs for each pval_anc column
top_snps_by_anc <- lapply(pval_columns, function(col) get_top_snps(result_data, col))

# Combine the results
names(top_snps_by_anc) <- pval_columns

# Print results
top_snps_by_anc

for (col in pval_columns) {
  top_snps <- get_top_snps(result_data, col)
  write.csv(top_snps, paste0("top_snps_THV_", col, ".csv"), row.names = FALSE)
}





