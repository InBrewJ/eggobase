# The simple (and dumb) way to run Eggobase

Uses GCE only, all we're doing is running the docker-compose file on a VM with port 80 open on the firewall

## GCE Infrastructure

Setting up literally one vm:

- `gcloud deployment-manager deployments create eggobase-gce-only --config vm.yaml`

Machine 'provisioning'

- To install docker on the vm
    - https://github.com/docker/docker-install
    - `curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh`
- To install docker-compose on the vm
    - https://github.com/docker/docker-install
    - `sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
    - `sudo chmod +x /usr/local/bin/docker-compose`

Monitor:

- `gcloud deployment-manager deployments describe eggobase-gce-only`

Setting firewall rules:

- `gcloud compute firewall-rules create allow-80 --allow tcp:80`

Make ephephemeral IP static:

- https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address#gcloud_3
```
gcloud compute addresses create eggobase-tomcat \
  --addresses $THE_VM_EXTERNAL_IP \
  --region us-central1	 
```

SSH in:

- `gcloud compute ssh eggobase-gce-only`

Tear down:

- `gcloud deployment-manager deployments delete eggobase-gce-only`

