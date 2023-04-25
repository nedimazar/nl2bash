#!/bin/bash

#SBATCH --job-name=training_run
#SBATCH --time=24:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=defq
#SBATCH -C TitanX-Pascal
#SBATCH --gres=gpu:1
#SBATCH --output=build-ada_eval.out

# Wiping the log file
> build-train.out

# Setting up the conda environment
conda init
source ~/.bashrc

# Do not ask why
conda activate apple

# Getting CUDA
module load cuda11.0/toolkit/11.0.3
module load cuDNN/cuda11.0/8.0.5

export PYTHONPATH=$PYTHONPATH:/var/scratch/nar720/new/nl2bash

cd /var/scratch/nar720/new/nl2bash/scripts

./bash-run.sh --data bash --prediction_file /var/scratch/nar720/new/nl2bash/fine_tuned_model_outputs/ada.output --eval --test
