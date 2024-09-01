devtools::install_github("Shuhua-Group/AncestryPainterV2")

library(AncestryPainterV2)

exp_q <- read.table("SLref_0.5allchr.pruned.14.Q", header = F)
exp_ind <- read.csv("ind.csv", header =F)
exp_order <- read.csv('POP.csv', stringsAsFactors = F, header = F)$V1
exp_cols <- read.table('col.csv', stringsAsFactors = F, header = F)$V1


pdf("exp_ances.K7.pdf", width = 45, height = 45)

sectorplot(Q = exp_q, ind = exp_ind, target = c("SL-Sinhala", "SL-Tamil", "SL-Moor", "SL-Malay"), poporder =
               exp_order, ancescols = exp_cols, cendis= 1.09, tarang1 = 90, tarang2 = 330, legend_mode = T, pop.lab.cex= 2.3, tar.lab.cex= 2.8, legend.pos= "bottomright" )
dev.off()
