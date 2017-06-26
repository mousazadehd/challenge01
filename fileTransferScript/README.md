3. Write a bash script that takes a file name and a destination path as input, and can find the names/IPs of the kubernetes machines dynamically and then copy the file passed as input to the destination path on all three machines

# Setting up the local computer (source)
1) Install and set up Google Cloud Platform SDK 
https://cloud.google.com/sdk/downloads

2) Generte a new SSH key pair and store in metadata of your GCP account 
https://cloud.google.com/compute/docs/instances/connecting-to-instance#standardssh

3) Download challenge01/fileTransferScript/transfer.sh

edit:
  1) The **serverNodes** based on your desired location to capture the cluster nodes. 
  2) depending on the name of the cluster you created for your Kubernetes you should change the filter in **line 11** of transfer.sh script.
  
  In this case my cluster name is **cluster-challenge**, so I have filtered the VMs by cluster name so that I am only copying the files into the cluster nodes and any other VMs. 
 
4) Run the transfer.sh and enter the 1) file name or path 2) the destination path 
see the result in here => https://github.com/mousazadehd/challenge01/blob/master/fileTransferScript/TransferFileToKubernetesClusterNodes.png
