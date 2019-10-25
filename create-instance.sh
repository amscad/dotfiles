#! /bin/bash
export PROJECT_ID="animated-vector-221810"
gcloud config set project $PROJECT_ID

export NETWORK="default-allow-ssh-mosh"
gcloud compute firewall-rules create $NETWORK --allow tcp:22,udp:60000-65000

gcloud compute instances delete $INSTANCE_NAME --zone=$ZONE

export INSTANCE_NAME="devinstance"
export ZONE="europe-west2-a"
export IMAGE_FAMILY="ubuntu-1804-lts"
export IMAGE_PROJECT="ubuntu-os-cloud"
export INSTANCE_TYPE="n1-standard-1"
export STARTUP_SCRIPT_URL="gs://dev-machine/init.sh"
gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE \
        --image-family=$IMAGE_FAMILY \
        --image-project=$IMAGE_PROJECT \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=10GB \
        --metadata startup-script-url=$STARTUP_SCRIPT_URL \
        --tags=$NETWORK
