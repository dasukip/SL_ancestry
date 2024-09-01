#!/bin/bash
#SBATCH -J sub
#SBATCH --mem 5G
#SBATCH --ntasks 1
#SBATCH --account=haberm-dubai
#SBATCH --array 1-22
#SBATCH -t 08:00:00


module purge; module load bluebear
module load BCFtools/1.10.2-GCC-9.3.0

echo Starting task $SLURM_ARRAY_TASK_ID

ID=$(seq 1 22 | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)


bcftools view -r chr${ID} ancestry.vcf.gz \
-Ob -o ancestry.chr${ID}.bcf.gz


