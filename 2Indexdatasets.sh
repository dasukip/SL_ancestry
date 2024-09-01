#!/bin/bash
#SBATCH -J view
#SBATCH --mem 100G
#SBATCH --ntasks 4
#SBATCH --account=haberm-dubai
#SBATCH --array 1-19
#SBATCH -t 08:00:00


module purge; module load bluebear
module load bear-apps/2022b
module load BCFtools/1.17-GCC-12.2.0

echo Starting task $SLURM_ARRAY_TASK_ID

ID_LIST=(1 3 4 5 6 7 8 9 10 11 12 14 15 16 17 18 19 20 21)
ID=${ID_LIST[$SLURM_ARRAY_TASK_ID-1]}

bcftools view -Oz -o ancestry.chr${ID}.bcf ancestry.chr${ID}.bcf.gz
rm ancestry.chr${ID}.bcf.gz
tabix ancestry.chr${ID}.bcf
tabix hgdp1kgp_chr${ID}.filtered.SNV_INDEL.phased.shapeit5.bcf 