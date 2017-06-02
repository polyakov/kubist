#!/usr/bin/env bash

# update vm
sudo yum update -y

# download and setup kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
#kubectl


#download and setup kops
wget curl https://github.com/kubernetes/kops/releases/download/1.6.0/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
#kops

# setup users and bucket for k8s
aws iam create-group --group-name kops
export arns="
arn:aws:iam::aws:policy/AmazonEC2FullAccess
arn:aws:iam::aws:policy/AmazonRoute53FullAccess
arn:aws:iam::aws:policy/AmazonS3FullAccess
arn:aws:iam::aws:policy/IAMFullAccess
arn:aws:iam::aws:policy/AmazonVPCFullAccess"
for arn in $arns; do aws iam attach-group-policy --policy-arn "$arn" --group-name kops; done

# create user and access key
# IMPORTANT: Capture the out key and secret
aws iam create-user --user-name kops
aws iam add-user-to-group --user-name kops --group-name kops
aws iam create-access-key --user-name kops

aws s3api create-bucket --bucket mongodb2018 --region us-east-1