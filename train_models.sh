#!/bin/bash

#SBATCH --job-name=training_run
#SBATCH --time=24:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=defq
#SBATCH -C TitanX-Pascal
#SBATCH --gres=gpu:1
#SBATCH --output=build-train.out

# Wiping the log file
> build-train.out

# Setting up the conda environment
conda init
source ~/.bashrc

# Do not ask why
conda activate apple

# TODO: Remove as needed
module load cuda11.0/toolkit/11.0.3
module load cuDNN/cuda11.0/8.0.5

# TODO: Setting up the working dir and python path, modifying as needed
cd /var/scratch/nar720/new/nl2bas
export PYTHONPATH=$PYTHONPATH:/var/scratch/nar720/new/nl2bash

# Installing Dependencies
make

# The meat and potatoes are here
cd /var/scratch/nar720/new/nl2bash/scripts

# Data filtering, split, and preprocessing
make data

# Training models
make train
