#!/bin/bash
#SBATCH -J plink
#SBATCH --mem 100G
#SBATCH --ntasks 3
#SBATCH --account=haberm-dubai
#SBATCH --array 1-19
#SBATCH -t 08:00:00


module purge; module load bluebear
module load PLINK/1.9b_6.24-x86_64


echo Starting task $SLURM_ARRAY_TASK_ID

ID=$(seq 1 22 | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)


plink --bcf mergedSLref.mask.chr${ID}.bcf --make-bed --out mergedSLref.mask.chr${ID} --double-id --allow-extra-chr


awk 'BEGIN{FS=OFS=" "}{print $1,$1":"$4,$3,$4,$5,$6}' mergedSLref.mask.chr${ID}.bim > mergedSLref.mask.chr${ID}.bim.reformat

mv mergedSLref.mask.chr${ID}.bim.reformat mergedSLref.mask.chr${ID}.bim
