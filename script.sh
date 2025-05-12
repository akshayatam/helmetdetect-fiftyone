#!/bin/bash
mkdir -p data
curl -L -o data/hard-hat-detection.zip https://www.kaggle.com/api/v1/datasets/download/andrewmvd/hard-hat-detection 
unzip -q data/hard-hat-detection.zip -d data 
rm data/hard-hat-detection.zip 
cd data 
#mv images JPEGImages 
mv annotations Annotations 
mkdir -p ImageSets 
mkdir -p ImageSets/Main 
touch ImageSets/Main/default.txt 
cd .. 
pip install -r requirements.txt 