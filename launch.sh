export IMAGE_FAMILY="pytorch-latest-gpu" # or "pytorch-latest-cpu" for non-GPU instances
export ZONE="us-east1-b"
export INSTANCE_NAME="fastai"
export INSTANCE_TYPE="n1-highmem-8" # budget: "n1-highmem-4"
export SANAME="fastai"
export PROJECT="fast-257423"

# budget: 'type=nvidia-tesla-k80,count=1'
gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE \
        --image-family=$IMAGE_FAMILY \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --service-account=$SANAME@$PROJECT.iam.gserviceaccount.com \
        --scopes="https://www.googleapis.com/auth/devstorage.full_control"\
        --accelerator="type=nvidia-tesla-p100,count=1" \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=200GB \
        --metadata="install-nvidia-driver=True" \
        --metadata-from-file startup-script=install_script.sh
sleep 180
gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080
