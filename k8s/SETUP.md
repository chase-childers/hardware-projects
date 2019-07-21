# Kubernetes on Raspbian (Debian Buster)

While working on personal containerized projects that utilized Dockers, I became interested in migrating some of the projects to [Kubernetes](https://kubernetes.io/).  Original expectation was to utilize [EKS](https://aws.amazon.com/eks/) as I have a preference for AWS services.  Timing also aligned for the release of the newest [Raspberry Pi 4](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/), which had expanded its Memory options to 2GB and 4GB variants. Also important to note that the release of the Raspberry Pi 4 was quickly followed with a new Raspbian OS variant based on Debian Buster. The combination of timing inspired me to build out my own Raspberry Pi Kubernetes Cluster.

## Original Guides

I'm not the first to do this with Raspberry Pi's, so I followed a few other guides that were written for previous Raspberry Pi versions and Raspbian OS versions.

*  [Serverless Kubernetes home-lab with your Raspberry Pis](https://blog.alexellis.io/serverless-kubernetes-on-raspberry-pi/) by Alex Ellis
* [Kubernetes on (vanilla) Raspbian Lite](https://blog.alexellis.io/serverless-kubernetes-on-raspberry-pi/) by [teamserverless](https://github.com/teamserverless)
* [Make your very own Kubernetes cluster for Raspberry Pi](https://medium.com/nycdev/k8s-on-pi-9cc14843d43) by Mofizur Rahman

# Setup Guide

## My Hardware

* 4x [Raspberry Pi 4](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/) 
* [Cluster Case](https://www.amazon.com/dp/B07MW24S61/) 
* 4x [1ft Cat 6 Ethernet Cables](https://www.amazon.com/dp/B01IQWGKQ6)
* 4x [Short USB C to USB 2.0 Cables](https://www.amazon.com/dp/B0711C43JP)
* 4x [SanDisk 32GB MicroSD Cards](https://www.amazon.com/dp/B00CNYV942/)
* 1x [Black Box USB-Powered 10/100 8 Port Switch](https://www.amazon.com/dp/B0148J50EY/)
* 1x [Anker USB Wall Charger, 60W 6 Port](https://www.amazon.com/dp/B00P936188/)

## Software Requirements

* [Etcher](https://www.balena.io/etcher/)
* [Raspbian Lite (Buster variant) - 2019-07-12](http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-07-12/)
* Access to Router 
  * Utilizing a [Nighthawk X4 - R7400v2](https://www.netgear.com/home/products/networking/wifi-routers/R7500.aspx) with [OpenWrt](https://openwrt.org/)

## 1. SD Card Setup

1. Following [this guide](https://www.raspberrypi.org/documentation/installation/installing-images/) for downloading and burning the image to an SD Card.

2. You can enable SSH by default before the first boot of your Raspberry Pi by adding a blank file titled `SSH` to the boot directrory.  You can read more in [this article](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-6-using-ssh/enabling-ssh#using-a-blank-boot-file-2-2)  This prevents the need of connecting a monitor to your Pi on first boot.

## 2. Hardware Setup

## 3. Software Setup

1. Discover IP Address
1. SSH Connect to Host
1. Open Raspi-Config

        sudo raspi-config

1. Change Password
1. Change Hostname
1. Update packages

       sudo apt-get update

1. Install Tmux and Vim (Or other text editor of choice)

        sudo apt-get install -yq vim tmux

1. Setup Static IP Address (`sudo vim /etc/dhcpcd.conf`)

       interface eth0
       static ip_address=x.x.x.y/24
       static routers=x.x.x.x
       static domain_name_servers=x.x.x.x 8.8.8.8

1. Add the Docker and Kubernetes Raspbian sources to [debian source list](https://wiki.debian.org/SourcesList)

       echo "[arch=armhf] https://download.docker.com/linux/raspbian stretch edge " >> sudo cat /etc/apt/sources.list.d/docker.list
       echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> sudo cat /etc/apt/sources.list.d/kubernetes.list

1. Download and add the GPG keys for the Docker debian sources

       sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - 
       sudo curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo apt-key add -     
       sudo curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
 
1. Install Docker

        curl -sL get.docker.com | sed 's/9)/10)/' | sh

1. User Modifications

        $ sudo usermod pi -aG docker && newgrp docker

1. Disable Swap

       sudo dphys-swapfile swapoff && \
       sudo dphys-swapfile uninstall && \
       sudo update-rc.d dphys-swapfile remove

    * Raspbian Buster also requires updating `/etc/dphys-swapfile` to configure swap to be of size 0.

          CONF_SWAPSIZE=0

    * In Raspbian Buster, there is an init process that will attempt to setup and run swap on OS initialization.  To disable, I remove this init file for dphys-swapfile

          sudo rm -rf /etc/init.d/dphys-swapfile

1. Modify `/boot/cmdline.txt`
`cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory`
1. Reboot (`sudo reboot`)
1. Update package definitions (`sudo apt-get update`)
1. Install kubeadm

       sudo apt-get install -qy kubeadm