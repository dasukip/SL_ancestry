a=read.csv("pca.csv",header=T)

x_min <- min(a$PC1) -0.2
x_max <- max(a$PC1) +0.2
y_min <- min(a$PC2) -0.2
y_max <- max(a$PC2) +0.2

plot(a$PC1, a$PC2, pch=a$pch, cex=0.8, xlab="Principal component 1", ylab="Principal component 2", cex.lab=0.8, cex.axis=0.7, bty="n", xlim = c(x_min, x_max), ylim = c(y_min, y_max))




library(ggplot2)

# Load your data
a <- read.csv("pca.csv", header = TRUE)

# Define color palette for the populations
pop_colors <- c("Sinhala" = "firebrick1", "Malay" = "royalblue", "Moor" = "darkolivegreen3") # Adjust colors as needed

# Plot using ggplot2
ggplot(a, aes(x = PC1, y = PC2)) +
  geom_point(aes(color = pop), size = 2) +
  scale_color_manual(values = pop_colors) +
  xlab("Principal component 1") +
  ylab("Principal component 2") +
  xlim(-1, 1) + 
  ylim(-1, 1) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    axis.text = element_text(size = 12, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  ) +
  scale_color_manual(values = pop_colors) +
  guides(color= guide_legend(nrow=1, title.position="bottom"))










