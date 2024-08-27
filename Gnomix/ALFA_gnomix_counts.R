ALFA_19_msp <- read.delim("/home/emchudleigh_5461113/files/Tools/gnomix-main/ALFA_FULL_OUTPUTS/Phased/chr19/ALFA_gnomix_results_chr19.txt")

# Load necessary library
library(data.table)

# Read the data
data <- fread("/home/emchudleigh_5461113/files/Tools/gnomix-main/ALFA_FULL_OUTPUTS/Phased/chr19/ALFA_gnomix_results_chr19.txt")

# Load necessary libraries
library(ggplot2)
library(reshape2)

# Define sample columns
sample_columns <- 7:ncol(data)

# Function to count ancestries for a single row
count_ancestries <- function(row) {
  table(factor(as.numeric(row[sample_columns]), levels = 0:7))
}

# Apply the function to each row and combine results into a data.table
ancestry_counts <- as.data.table(t(apply(data, 1, count_ancestries)))

# Define ancestry labels
ancestry_labels <- c("EUR", "EAS", "NAT", "AFR", "SAS", "AHG", "OCE", "WAS")

# Set new column names using the ancestry labels
setnames(ancestry_counts, ancestry_labels)

# Combine SNP column with ancestry counts
result <- cbind(data[, .(Snp = spos)], ancestry_counts)

# View the result
print(result)

# Melt the data for plotting
melted_data <- melt(result, id.vars = "Snp", variable.name = "Ancestry", value.name = "Count")

# Create the bar chart
ggplot(melted_data, aes(x = Ancestry, y = Count, fill = Ancestry)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Ancestry Counts per SNP",
       x = "Ancestry",
       y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Filter data where Count is greater than 1
filtered_data <- melted_data[Count > 1]

ggplot(filtered_data, aes(x = factor(Snp), y = Count, fill = Ancestry)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Ancestry Counts per SNP (Count > 1)",
       x = "SNP",
       y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3")




