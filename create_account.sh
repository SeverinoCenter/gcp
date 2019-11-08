#https://cloud.google.com/iam/docs/creating-managing-service-account-keys
export SANAME="fastai"
export SADESCRIPTION="fastai"
export DISPLAYNAME="fastai"
GCLOUD_PROJECT="fast-257423"

gcloud iam service-accounts create $SANAME \
    --description $SADESCRIPTION \
    --display-name $DISPLAYNAME

SERVICE_ACCOUNT=$(gcloud iam service-accounts list --filter=name:"$SANAME" --format='value(email)')

gcloud projects add-iam-policy-binding $GCLOUD_PROJECT \
    --member="serviceAccount:$SERVICE_ACCOUNT"\
    --role="roles/storage.objectAdmin"
