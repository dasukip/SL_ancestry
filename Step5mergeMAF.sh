#!/bin/bash
#SBATCH -J merge
#SBATCH --mem 100G
#SBATCH --ntasks 4
#SBATCH --account=haberm-dubai
#SBATCH -t 08:00:00

module purge; module load bluebear
module load PLINK/1.9b_6.24-x86_64



plink --bfile mergedSLref.chr1_maf05 --merge-list merge_list.txt --make-bed --out SLref_allchr --double-id
