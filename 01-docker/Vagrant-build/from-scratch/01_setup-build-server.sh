#!/bin/bash

# run this script for a fresh install on Fedora
sudo dnf install -y git-all 
sudo dnf install -y wget
sudo dnf install -y unzip
curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -
sudo dnf install -y nodejs




