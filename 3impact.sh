#!/bin/bash
#SBATCH -J view
#SBATCH --mem 2G
#SBATCH --ntasks 2
#SBATCH --qos=bbdefault
#SBATCH --account=haberm-dubai
#SBATCH -t 00:30:00

module purge; module load bluebear
module load bear-apps/2022b
module load BCFtools/1.17-GCC-12.2.0

bcftools +split-vep annotate.VEP.vcf.gz -d -c IMPACT \
| bcftools query \
-f'%CHROM\t%POS\t%IMPACT\n' \
| awk '{OFS="\t";if($3=="HIGH") print $0}' \
> positions.severe.txt


bcftools +split-vep annotate.VEP.vcf.gz -d -c IMPACT \
| bcftools query \
-f'%CHROM\t%POS\t%IMPACT\n' \
| awk '{OFS="\t";if($3=="MODERATE") print $0}' \
> positions.moderate.txt