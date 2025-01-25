install.packages("fst")
library(fst)
library(ggplot2)

#Getting variant contribution to PC1 for PCA1
loadings <- pca.1$loadings
PC1variants <- order(abs(loadings[,1]), decreasing = T)[1:10]
PC1variants_names <- aa.genlight@loc.names[PC1variants]
PC1variants_names
data.frame(Variant = PC1variants_names, Loading = PC1variants)

#Getting varinat contribution to PC2 for PCA1
loadings <- pca.1$loadings
PC2variants <- order(abs(loadings[,2]), decreasing = T)[1:10]
PC2variants_names <- aa.genlight@loc.names[PC2variants]
PC2variants_names
data.frame(Variant = PC2variants_names, Loading = PC2variants)

#NENDATA
labnendf <- read.table("out.windowed.weir1000LAB_NEN.txt", header = TRUE, sep = "\t")
labnendf$number <- seq_len(nrow(labnendf))

#Plotting all NEN Fst results
ggplot(labnendf, aes(number, WEIGHTED_FST)) + 
  geom_point(color = "Dark Green", shape = "square") +
  xlab("Sweep Number") +
  ylab("Weighted Fst Score") +
  ggtitle("Nent vs Langdon Beck Fst Score") +
  theme(plot.title = element_text(hjust = 0.5))

#Creating table with top 1% Weighted Fst scores for NEN
top25nen <- head(labnendf, 25)
nensorted <- labnendf[order(labnendf$WEIGHTED_FST, decreasing = TRUE), ]
top25nen <- head(nensorted, 25)


#ODNDATA
labodndf <- read.table("out.windowed.weir1000LAB_ODN.txt", header = TRUE, sep = "\t")
labodndf$number <- seq_len(nrow(labodndf))

#Plotting all ODN Fst Results
ggplot(labodndf, aes(number, WEIGHTED_FST)) + 
  geom_point(color = "Red", shape = "square") +
  xlab("Sweep Number") +
  ylab("Weighted Fst Score") +
  ggtitle("Odin's Mine vs Langdon Beck Fst Score") +
  theme(plot.title = element_text(hjust = 0.5))

#Creating table with top 1% Weighted Fst scores for ODN
top25odn <- head(labodndf, 25)
odnsorted <- labodndf[order(labodndf$WEIGHTED_FST, decreasing = TRUE), ]
top25odn <- head(odnsorted, 25)
