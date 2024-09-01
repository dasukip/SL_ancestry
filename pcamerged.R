#!/bin/bash
#SBATCH -J pca
#SBATCH --mem 20G
#SBATCH --ntasks 1
#SBATCH --account=haberm-dubai
#SBATCH -t 08:00:00

#module purge; module load bluebear
#module load R/3.6.0-foss-2019a
#R


library(ggplot2)

a= read.csv("plink.allchrmask.csv", header=T)
color_vector <- c("purple",
                  "gold",
                  "darkorange2",
                  "burlywood",
                  "cyan3",
                  "deeppink3",
                  "royalblue",  
                  "plum",
                  "firebrick1",
                  "green")  

ggplot(a, aes(x = PC1, y = PC2)) +
  geom_point(aes(color = pop), size = 2) +
  xlab("Principal component 1") +
  ylab("Prinicipal component 2") +
  #xlim(-0.004, 0.009) + 
  #ylim(-0.0065, -0.0015) +
  theme_minimal() +
  theme(legend.position = "bottom", legend.direction="horizontal",
        legend.title=element_blank(),
        legend.text = element_text(size = 8),
        axis.text = element_text(size = 9, face = "bold"),  # Set axis text font size to 10
        axis.title = element_text(size = 9, face = "bold") 
  ) +
  scale_color_manual(values = color_vector) +
  guides(color= guide_legend(nrow=2, title.position="bottom"))


