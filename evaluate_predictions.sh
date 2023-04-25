#!/bin/bash

#SBATCH --job-name=training_run
#SBATCH --time=24:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=defq
#SBATCH -C TitanX-Pascal
#SBATCH --gres=gpu:1
#SBATCH --output=eval.out

# Wiping the log file
> eval.out

# Setting up the conda environment
conda init
source ~/.bashrc
conda activate apple

# TODO: Remove as needed
module load cuda11.0/toolkit/11.0.3
module load cuDNN/cuda11.0/8.0.5

# TODO: Setting up the working dir and python path, modifying as needed
export PYTHONPATH=$PYTHONPATH:/var/scratch/nar720/new/nl2bash
cd /var/scratch/nar720/new/nl2bash/scripts

./bash-run.sh --data bash --prediction_file /var/scratch/nar720/new/nl2bash/fine_tuned_model_outputs/ada.output --eval --test
