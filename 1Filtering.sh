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


#list sites missing > 20% of samples
bcftools filter -i 'F_MISSING > 0.2' passmerged.vcf.gz | bcftools query -f '%CHROM\t%POS\n' > missing.sites


#list depth, get average, get sites failing

bcftools query -f '%CHROM\t%POS[\t%DP]\n' passmerged.vcf.gz >depth.sites

awk '
 {
     total_dp = 0;
     num_samples = 0;
     for (i = 3; i <= NF; i++) {
         if ($i != ".") {  # skip missing DP values
             total_dp += $i;
             num_samples++;
         }
     }
     avg_dp = total_dp / num_samples;
     print $1, $2, avg_dp;
 }
 ' depth.sites > depth.all.txt

awk '{ sum += $3; n++ } END { if (NR > 1) print sum / n; }' depth.all.txt >> depth.txt

#DP=32 DP/2=16 DP*3=96

bcftools query -i 'FORMAT/DP<16 || FORMAT/DP>96' -f '%CHROM\t%POS\n' passmerged.vcf.gz > depth.badsites

#merge badsites and remove them, plus keep only biallelic snps, remove singletons (ancestry)
cat missing.sites depth.badsites | sort -n -u -k2 | awk '{print $1"\t"$2}' > filtered.sites

bcftools view -c2 -m2 -M2 -v snps -T ^filtered.sites passmerged.vcf.gz -Oz -o ancestry.vcf.gz

# make a vcf to annotate, just removing badsites
bcftools view -T ^filtered.sites passmerged.vcf.gz -Oz -o annotate.vcf.gz

