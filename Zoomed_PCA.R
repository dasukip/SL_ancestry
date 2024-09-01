
library(ggplot2)
library(RColorBrewer)

a= read.csv("newpopplink.allchrmask.csv", header=T)

custom_palette <- c( "yellow","black",
                     "darkkhaki",
                     "magenta", "green","royalblue","darkorange", "slategray1", "cyan",
                     "gold", "purple"
)



ggplot(a, aes(x = PC1, y = PC2)) +
  geom_point(aes(color = pop), size = 2) +
  xlab("Principal component 1") +
  ylab("Prinicipal component 2") +
  xlim(-0.004, 0.009) + 
  ylim(-0.0065, -0.0015) +
  theme_minimal() +
  theme(legend.position = "bottom", legend.direction="horizontal",
        legend.title=element_blank(),
        legend.text = element_text(size = 8),
        axis.text = element_text(size = 9, face = "bold"),  # Set axis text font size to 10
        axis.title = element_text(size = 9, face = "bold") 
  ) +
  scale_color_manual(values = custom_palette ) +
  guides(color= guide_legend(nrow=2, title.position="bottom"))



