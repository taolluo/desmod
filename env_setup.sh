#!/bin/bash

sudo mkfs.ext4 /dev/sda4
#sudo mkfs.ext4 /dev/xvda4
# This formats the partition to be of type ext4
sudo mkdir -p /mnt/data
# Create a directory where the filesystem will be mounted
#sudo mount /dev/xvda4 /mnt/data
sudo mount /dev/sda4 /mnt/data
sudo chmod +777 /mnt/data
# Mount the partition at the particular directory

df -h | grep "data"


wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
eval "$($HOME/miniconda/bin/conda shell.bash hook)"

conda init

conda create -n pypy -c conda-forge pypy=7.3.3 -y
conda activate pypy
cd /mnt/data
git clone https://github.com/ttaoluo/desmod.git
cd desmod
pip install -r requirements.txt
pip install -e .

