#!/bin/bash
#SBATCH -J admixture
#SBATCH --mem 100G
#SBATCH --ntasks 20
#SBATCH --array 1-11
#SBATCH --qos=bbdefault
#SBATCH --account=haberm-dubai
#SBATCH -t 82:00:00


module purge; module load bluebear
module load bear-apps/2022b
module load AdmixTools/7.0.2-foss-2022b-R-4.3.1-Perl-5.36.0

echo Starting task $SLURM_ARRAY_TASK_ID

ID=$(seq 6 16 | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)

ADMIXTURE_PATH="/rds/projects/h/haberm-dubai/khp208/PacBiodata/Admixture/admixture_linux-1.3.0"

$ADMIXTURE_PATH/admixture SLref_0.5allchr.pruned.bed ${ID} -j24 --cv
