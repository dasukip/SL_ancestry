#!/bin/bash
#SBATCH -J pca
#SBATCH --mem 100G
#SBATCH --ntasks 1
#SBATCH --account=haberm-dubai
#SBATCH -t 72:00:00

module purge; module load bluebear
module load PLINK/1.9b_6.24-x86_64



plink --bfile SLref_0.5allchr.pruned --pca
