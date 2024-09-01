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


ID=$(seq 1 22 | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)


bcftools merge hgdp1kgp_chr${ID}.filtered.SNV_INDEL.phased.shapeit5.bcf ancestry.chr${ID}.bcf \
|bcftools view --samples-file ^removedsamples.txt --force-samples -c2 -m2 -M2 -v snps \
-Ob -o mergedSLref.chr${ID}.bcf
bcftools index mergedSLref.chr${ID}.bcf
bcftools view -R hgdp_wgs.20190516.mask.bed mergedSLref.chr${ID}.bcf -Ob -o mergedSLref.mask.chr${ID}.bcf 
