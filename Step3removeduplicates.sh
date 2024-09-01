#!/bin/bash
#SBATCH -J removedup
#SBATCH --mem 100G
#SBATCH --ntasks 4
#SBATCH --account=haberm-dubai
#SBATCH --array 1-19
#SBATCH -t 08:00:00

module purge; module load bluebear
module load PLINK/2.00-alpha2-x86_64

echo Starting task $SLURM_ARRAY_TASK_ID

ID=$(seq 1 22 | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)


plink2 --bfile mergedSLref.mask.chr${ID} --rm-dup exclude-all --make-bed --out mergedSLref.mask.chr${ID}.v1
