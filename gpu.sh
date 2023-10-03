#!/bin/bash

# Update package list and install necessary packages
sudo apt update
sudo apt -y install ocl-icd-opencl-dev
sudo apt -y install nano
sudo apt -y install htop
sudo apt -y install nvtop
sudo apt -y install cmake
sudo apt install python3-pip

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
cd XENGPUMiner
chmod +x build.sh
./build.sh -cuda_arch sm_86

# Update the configuration file
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0xbC95Eb768Fa40d6281e113F8da21095a9e535124/g' config.conf

# Install Python requirements
pip install -U -r requirements.txt
nohup python miner.py --gpu=true > miner.log 2>&1 &
nohup ./xengpuminer > xengpuminer.log 2>&1 &
