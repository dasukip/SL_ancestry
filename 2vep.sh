#!/bin/bash
#SBATCH -J view
#SBATCH --mem 100G
#SBATCH --ntasks 1
#SBATCH --qos=bbdefault
#SBATCH --account=haberm-dubai
#SBATCH -t 24:00:00

module purge; module load bluebear
module load bear-apps/2022a
module load VEP/107-GCC-11.3.0

vep \
--cache \
--dir_cache /rds/projects/h/haberm-dubai/khp208/PacBiodata/vep_cache \
--offline \
-i annotate.vcf.gz \
-o annotate.VEP.vcf.gz \
--vcf \
--assembly GRCh38 \
--stats_file anno.statfile \
--sift b \
--polyphen b \
--humdiv \
--symbol \
--af_1kg
