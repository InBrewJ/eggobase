# The simple (and dumb) way to run Eggobase

## Uses GCE only, all we're doing is running the docker-compose file on a VM

Setting up literally one vm:

- `gcloud deployment-manager deployments create eggobase-gce-only --config vm.yaml`

Monitor:

- `gcloud deployment-manager deployments describe eggobase-gce-only`

Tear down:

- `gcloud deployment-manager deployments delete eggobase-gce-only`