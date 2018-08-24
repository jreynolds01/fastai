#!/usr/bin/env bash

# This should set up an Ubuntu DSVM for this course
# Assumes you've deployed an NC-series VM, so CUDA
# is already installed in the py35 conda env

# this is based on the last part of 
# http://files.fast.ai/setup/paperspace

## clone repo from github into the directory
## 
WD=~/notebooks

## activate appropriate conda env
source activate py35


cd $WD

echo "Working in `pwd`"

if [ -d "fastai" ]; then
    echo "fastai already exists."
else
    git clone git@github.com:fastai/fastai.git
fi

## create data directory
if [ -d "data" ]; then
    echo "data dir already exists"
else
    mkdir data
fi

# download the dogscats data!
# do this...

cd data
echo "downloading data..."
wget http://files.fast.ai/data/dogscats.zip
echo "unzipping data..."
unzip -q dogscats.zip
cd ${WD}/fastai/courses/dl1/
## link data dir in the dl1 course.
ln -s ~/data ./

echo "Done!"
# not sure utility of this - will come back after walking through course...
#jupyter notebook --generate-config
#echo "c.NotebookApp.ip = '*'" >> ~/.jupyter/jupyter_notebook_config.py
#echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py

# already installed==7.2.1 (should check version requirements)
#pip install ipywidgets
# looks like they are installed.
#jupyter nbextension enable --py widgetsnbextension --sys-prefix
# echo
# echo ---
# echo - YOU NEED TO REBOOT YOUR PAPERSPACE COMPUTER NOW
# echo ---