#gsutil rsync -d -r ./greenwich.hr gs://greenwichhr
export BUCKET="greenwichhr"
#mount greenwich
mkdir /home/jupyter/$BUCKET
gcsfuse $BUCKET /home/jupyter/$BUCKET
