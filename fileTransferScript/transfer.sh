#!/bin/bash

# Captures the file name or path that will be transferred to cluster nodes from user input 
echo "Enter the file name or file path you would like to transfer: "
read file
# Captures destination directory on VM
echo "Enter the destination in Kubernetes cluster nodes that you would like to transfer your file to:"
read destination
# Defines the Kubernetes cluster nodes
serverNodes="/Users/dariush/Documents/FileCopy-Script/serverNodes.txt"
gcloud compute instances list | egrep cluster-challenge | tr -s ' ' | cut -d ' ' -f 1 > $serverNodes

# Transfer the file specified by user to cluster nodes and logs the errors in log.txt
while read server; do
{
gcloud compute scp $file $server:$destination --zone us-central1-a
} 2>> /Users/dariush/Documents/FileCopy-Script/logs.txt
done < $serverNodes
