#!/bin/bash
#SBATCH -J prune
#SBATCH --mem 100G
#SBATCH --ntasks 4
#SBATCH --account=haberm-dubai
#SBATCH -t 72:00:00

module purge; module load bluebear
module load PLINK/1.9b_6.24-x86_64


plink --bfile SLref_allchr --indep-pairwise 200 25 0.5 --double-id --out plink.mask.0.5allchr
plink --bfile SLref_allchr --extract plink.mask.0.5allchr.prune.in --make-bed --out SLref_0.5allchr.pruned --double-id



