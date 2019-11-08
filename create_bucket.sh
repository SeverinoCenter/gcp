#Create a new bucket and sync from idea server. 
gsutil mb gs://greenwichhr/
gsutil rsync -d -r ./greenwich.hr gs://greenwichhr
