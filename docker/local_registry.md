# Docker Registry

While developing locally in an isolated Kubernetes cluster, I wanted to also execute and refer to a local Docker registry.  

## Original Guides

* [Deploying a Docker Registry](https://docs.docker.com/registry/deploying/)
* [Configure Insecure Docker Registry](https://github.com/Juniper/contrail-docker/wiki/Configure-docker-service-to-use-insecure-registry)

# Setup Guide

## Hardware

* CPU Info (Westmere)

        vendor_id       : GenuineIntel
        cpu family      : 6
        model           : 62
        model name      : Intel(R) Xeon(R) CPU E5-2640 v2 @ 2.00GHz
        stepping        : 4
        microcode       : 0x42e
        cpu MHz         : 1618.581
        cache size      : 20480 KB
        physical id     : 0
        siblings        : 16
        core id         : 0
        cpu cores       : 8
        apicid          : 0
        initial apicid  : 0
        fpu             : yes
        fpu_exception   : yes
        cpuid level     : 13
        wp              : yes
        flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt dtherm ida arat pln pts md_clear flush_l1d
        bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds
        bogomips        : 4002.63
        clflush size    : 64
        cache_alignment : 64
* [Motherboard](https://www.amazon.com/dp/B0064L8UJM)
* 32Gb Memory @ 1333Mhz
* [500 GB SSD](https://www.amazon.com/dp/B0781Z7Y3S/)

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
