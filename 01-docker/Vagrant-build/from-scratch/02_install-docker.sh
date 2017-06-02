#!/bin/bash

# run this script for a fresh install on Fedora
sudo dnf install -y docker
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
