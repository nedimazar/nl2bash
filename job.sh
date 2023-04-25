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

# Getting CUDA
module load cuda11.0/toolkit/11.0.3
module load cuDNN/cuda11.0/8.0.5

# Setting up the working dir and python path
cd /var/scratch/nar720/new/nl2bash
export PYTHONPATH=$PYTHONPATH:/var/scratch/nar720/new/nl2bash

# Installing Dependencies
# make

# The meat and potatoes are here
cd /var/scratch/nar720/new/nl2bash/scripts

# Data filtering, split, and preprocessing
# make data

# Training models
make train
