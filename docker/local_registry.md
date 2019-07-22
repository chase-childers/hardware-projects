# Docker Registry

While developing locally in an isolated Kubernetes cluster, I wanted to also execute and refer to a local Docker registry.  

## Original Guides

* [Deploying a Docker Registry](https://docs.docker.com/registry/deploying/)
* [Configure Insecure Docker Registry](https://github.com/Juniper/contrail-docker/wiki/Configure-docker-service-to-use-insecure-registry)

# Setup Guide

This Registry is setup on my [primary x86 server](https://github.com/chase-childers/hardware-projects)

## Software

* Base OS - [Ubuntu Server - 18.04 LTS](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes/18.04)
  * Pre-Installed Packages
     * [minikube](https://github.com/kubernetes/minikube)
     * [docker](https://www.docker.com/)
     * [aws-cli](https://aws.amazon.com/cli/)

# Setup Guide

* Configure Hostname on Server(`/etc/hostname`)
* Run Docker contaier for registry

        $ docker run -d -p 5000:5000 --restart=always --name registry registry:2

## Configure Nodes

Docker by default attempts to talk to a registry server over HTTPS.  To connect to a registry via a non-secure connection, individual nodes must be configured for each non-secure registry.  This needs to be run on each individual node that wants to connect to your docker registry.  This is  making the assumption that you are running the docker registry on your local network for nodes that are also on the local network.

* Add Insecure Registries to Docker deamon configuration.

      echo '{ "insecure-registries" : ["<hostname>:5000"] }' >> sudo cat /etc/docker/daemon.json

* Restart Docker 

       sudo docker restart
