# Hardware Projects

This is a collection of notes and scripts for different projects.  Some of these notes are collections or revisions of other people's notes on setting up the same given device.  Not all of them work out of the box, so I'm updating them with modifications required to work.  Also trying to attempt to site as many original sources as possible in the notes.

## List of Hardware

### Primary x86 Server

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
* Base OS - [Ubuntu Server - 18.04 LTS](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes/18.04)


### Raspberry Pi's

* 4x [Raspberry Pi 4 B 2GB](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/)
  * Running Raspbian Buster
* 3x [Raspberry Pi 3 B+](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/)
  * Running Raspbian Stretch 