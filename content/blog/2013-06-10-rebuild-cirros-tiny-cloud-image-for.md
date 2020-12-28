---
draft: true
title: Rebuild CirrOS tiny cloud image for VMware
author: rsokolkov
type: post
date: 2013-06-10T11:38:00+00:00
url: /rebuild-cirros-tiny-cloud-image-for/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 386446098467682241
blogger_author:
  - 14718283222819047051
blogger_comments:
  - 1
blogger_permalink:
  - /2013/06/rebuild-cirros-tiny-cloud-image-for.html
categories:
  - Uncategorized
tags:
  - cirros
  - cloud
  - fusion mpt
  - lsilogic
  - openstack
  - vmware

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  We&#8217;ve faced problems when tried to boot <a href="https://launchpad.net/cirros" target="_blank">CirrOS</a> tiny cloud image as guest OS on VMware ESXi managed by OpenStack.</p> 
  
  <p>
    <b>Problem description:</b> It boots up without any storage disk or NIC. By default OpenStack (with VMwareESXDriver) uses LSILogic SCSI controler (Fusion MPT) for VMware guests. Seems like there is no drivers(modules) for this type of SCSI controler. Let&#8217;s try to add it.
  </p>
  
  <p>
    To add this additional drivers we need to rebuild CirrOS as described in official <a href="http://bazaar.launchpad.net/~smoser/cirros/trunk/view/head:/README" target="_blank">README</a> . I&#8217;ve done all stuff on Ubuntu 12.04 LTS.
  </p>
  
  <p>
    * Get build dependencies, clone source code repo.
  </p>
  
  <blockquote class="tr_bq">
    <p>
      sudo apt-get -y install bison flex texinfo build-essential gettext ncurses-dev unzip bzr qemu-kvm cvs quilt <br /> bzr branch lp:cirros<br /> cd cirros
    </p>
  </blockquote>
  
  <p>
    * Download buildroot and setup environment and apply local cirros patches to it.
  </p>
  
  <blockquote class="tr_bq">
    <p>
      br_ver=&#8221;2012.05&#8243;<br />mkdir -p ../download<br />ln -snf ../download download<br />( cd download && wget http://buildroot.uclibc.org/downloads/buildroot-${br_ver}.tar.gz )<br />tar -xvf download/buildroot-${br_ver}.tar.gz<br />ln -snf buildroot-${br_ver} buildroot<br />./bin/mkcabundle > src/etc/ssl/certs/ca-certificates.crt<br />( cd buildroot && QUILT_PATCHES=$PWD/../patches-buildroot quilt push -a )<br />make ARCH=i386 br-source
    </p>
  </blockquote>
  
  <p>
    &nbsp;* Build buildroot for a given arch. ARCH should be set to &#8216;i386&#8217;, &#8216;x86_64&#8217; or &#8216;arm&#8217;.
  </p>
  
  <blockquote class="tr_bq">
    <p>
      make ARCH=i386 OUT_D=$PWD/output/i386
    </p>
  </blockquote>
  
  <p>
  </p>
  
  <blockquote class="tr_bq">
    <p>
      <i>This will do a full buildroot build, which will take a while. The output that CirrOS is interested in is output/i386/rootfs.tar. That file is the full buildroot filesystem, and is used as input for subsequent steps here.</i>
    </p>
  </blockquote>
  
  <p>
    &nbsp;* Download a kernel to use. I&#8217;ve used ubuntu virtual i386 kernel.
  </p>
  
  <blockquote class="tr_bq">
    <p>
      wget https://launchpad.net/ubuntu/+archive/primary/+files/linux-image-3.2.0-41-virtual_3.2.0-41.66_i386.deb -O download/linux-image-3.2.0-41-virtual_3.2.0-41.66_i386.deb
    </p>
  </blockquote>
  
  <p>
    * Patch cirros bundle script. In simple, this script used to rebuild rootfs.tar with custom kernel. It creates two initramfs files: &#8220;standart&#8221; and &#8220;smaller&#8221; w/o kernel modules. By default it uses second one. To prevent it and use standart initramfs do:
  </p>
  
  <blockquote class="tr_bq">
    <p>
      sed -i &#8216;s/cp &#8220;${initramfs}.smaller&#8221;/cp &#8220;${initramfs}&#8221;/&#8217; bin/bundle
    </p>
  </blockquote>
  
  <p>
    * Add necessary kernel modules. Bundle script gets modules to include in image from &#8220;src/etc/modules&#8221; . For Fusion MPT devices (i.e. lsiLogic scsi controller) support add &#8220;mptbase&#8221; and &#8220;mptscsih&#8221; modules:
  </p>
  
  <blockquote class="tr_bq">
    <p>
      echo -e &#8220;mptbasenmptscsih&#8221; >> src/etc/modules
    </p>
  </blockquote>
  
  <p>
    *&nbsp; build disk images using special script bin/bundle
  </p>
  
  <blockquote class="tr_bq">
    <p>
      sudo ./bin/bundle -v output/$ARCH/rootfs.tar download/linux-image-3.2.0-41-virtual_3.2.0-41.66_i386.deb output/$ARCH/images
    </p>
  </blockquote>
  
  <p>
    Resulting images located in output/i386/images . You could use bootable qcow2 image &#8220;output/i386/images/disk.img&#8221; or ami (blank.img), ari (initramfs), aki (kernel). OpenStack supports now only flat vmdk images for vmware and we need to convert qcow2 to raw:
  </p>
  
  <blockquote class="tr_bq">
    <p>
      qemu-img convert -O raw output/i386/images/disk.img output/i386/images/disk-raw.img
    </p>
  </blockquote>
  
  <p>
    How to add image to glance:
  </p>
  
  <blockquote class="tr_bq">
    <p>
      glance add name=&#8221;cirros-vmware&#8221; disk_format=raw container_format=bare is_public=true vmware_adaptertype=&#8221;lsiLogic&#8221; vmware_disktype=&#8221;preallocated&#8221; vmware_ostype=&#8221;otherGuest&#8221; < disk-raw.img
    </p>
  </blockquote>
  
  <p>
    &nbsp;
  </p>
</div>
