#Logs for this are:
#cat /var/log/daemon.log to get the log files
#grep 'startup-script' /var/log/daemon.log

#Install GCSFUSE per https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/installing.md
echo "Installing GCSFUSE"
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install gcsfuse
#End

su jupyter
#Install Fastai
cd tutorials/fastai/course-v3 && git checkout . && git pull
/opt/anaconda3/bin/conda install -y -c fastai fastai
mkdir /home/jupyter/startupdata
chown jupyter:jupyter /home/jupyter/startupdata

#start gcsfuse.
echo 'gcsfuse() {
 /usr/bin/gcsfuse "$@"
}' >> /home/jupyter/.bashrc
git clone https://github.com/SeverinoCenter/gcp /home/jupyter/
#/usr/bin/gcsfuse startupdata /home/jupyter/startupdata
