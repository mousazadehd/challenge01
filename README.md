

**create-cluster.sh**



# Create persistent disk for the postgres POD

**gcloud compute disks create pg-data-disk --size 5GB**

# Attach the persistent disk to one of the VMs in order to format 

**gcloud compute instances attach-disk gke-cluster-challenge-default-pool-0e97ea3f-9wdd --disk pg-data-disk
**

More details :  https://cloud.google.com/compute/docs/disks/add-persistent-disk#formatting


**sudo wget https://raw.githubusercontent.com/kubernetes/kubernetes/master/cluster/saltbase/salt/helpers/safe_format_and_mount**

**sudo chmod 755 safe_format_and_mount**

**sudo sh safe_format_and_mount -m "mkfs.ext4 -F" /dev/disk/by-id/google-persistent-disk-1 /media/pg-data**


# Create postgres service 

**kubectl create -f postgres-persistence.yml
kubectl create -f postgres-claim.yml
kubectl create -f postgres-pod.yml
kubectl create -f postgres-service.yml**



