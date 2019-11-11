export IMAGE_FAMILY="pytorch-latest-gpu" # or "pytorch-latest-cpu" for non-GPU instances
export ZONE="us-east1-b"
export INSTANCE_NAME="fastai"
export INSTANCE_TYPE="n1-highmem-8" # budget: "n1-highmem-4"

gcloud compute instances start $INSTANCE_NAME  --zone=$ZONE
