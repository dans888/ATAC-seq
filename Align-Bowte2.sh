#PBS -S /bin/bash
#PBS -q batch
#PBS -N AlignATACsticklebackgenome
#PBS -l nodes=1:ppn=24
#PBS -l mem=20gb
#PBS -l walltime=24:00:00
#PBS -m ae

cd /scratch/des65576/LWL2F/

export cores=24
export bam=LW_L2_F
export outDir="."
module load Bowtie2/2.3.4.1-foss-2016b

export btBuild=/scratch/des65576/stick
export read1_list=`ls -m *1P* | tr -d ' \n'`
export read2_list=`ls -m *2P* | tr -d ' \n'`

bowtie2 -p ${cores} --no-unal -x ${btBuild} \
        -1 ${read1_list} \
        -2 ${read2_list} \
        -S ${outDir}/${bam}.sam


