#!/bin/bash
#SBATCH --job-name=VERSE       # Job name
#SBATCH --nodes=1                 # Number of nodes
#SBATCH --cpus-per-task=32       # CPU cores/threads
#SBATCH --gres=gpu:1              # Number of GPUs (per node)
#SBATCH --mem=400000M               # memory (per node)
#SBATCH --time=0-30:00            # time (DD-HH:MM)
#SBATCH --partition=zhanglab.p    # use zhanglab partition
#SBATCH --output=./log/1000K_es32_total.log       # Standard output


python total.py