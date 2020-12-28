---
draft: true
title: Add pci hot-plug in images for Openstack.
author: rsokolkov
type: post
date: 2011-11-07T07:16:00+00:00
url: /add-pci-hot-plug-in-images-for/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 6320668444280821663
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2011/11/add-pci-hot-plug-in-images-for.html
categories:
  - Uncategorized
tags:
  - acpiphp
  - centos
  - diablo
  - fedora
  - hotplug
  - nova-volume
  - openstack
  - ubuntu

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  <div>
    We use Openstack Diablo release on fedora. To fully&nbsp;use openstack <b>nova-volume</b> service&nbsp;you&nbsp;need to add PCI hot-plug feature in guest system. It will allow to attach and detach volumes without reboot. Linux Kernels support this feature with acpiphp module.
  </div>
  
  <div>
  </div>
  
  <div>
    <b>Ubuntu:</b>
  </div>
  
  <div>
    We need to load <b>acpiphp</b> module. To load it automatically after reboot
  </div>
  
  <blockquote class="tr_bq">
    <p>
      &nbsp;echo &#8220;acpiphp&#8221; >> /etc/modules
    </p>
  </blockquote>
  
  <p>
    Tested on Ubuntu 11.04, 11.10.
  </p>
  
  <p>
    <b>Fedora:</b><br /> I have use libvirt VMs and&nbsp;by default there is&nbsp;acpi=off kernel parameter. To allow pci hotplugging remove <b>acpi=off</b> from kernel parameters by editing&nbsp;<b>/etc/grub.conf</b>. Tested on fedora 14, 15
  </p>
  
  <p>
    <b>CentOS:</b><br /> Simplest solution it is add&nbsp;&#8220;modprobe acpiphp&#8221; string in&nbsp;/etc/rc.local. Tested on CentOS 5.6
  </p>
  
  <blockquote class="tr_bq">
    <p>
      echo &#8220;modprobe acpiphp&#8221; >>&nbsp;/etc/rc.local
    </p>
  </blockquote>
  
  <p>
    <b>How to attach volume in OpenStack:</b><br /> To create 1GB volume with euca2ools and attach it to instance:
  </p>
  
  <blockquote class="tr_bq">
    <p>
      euca-create-volume -s 1 -z nova
    </p>
  </blockquote>
  
  <blockquote class="tr_bq">
    <p>
      euca-attach-volume -i i-00000043 -d /dev/vdb vol-00000003&nbsp;
    </p>
  </blockquote>
  
  <p>
    To see disk in guest system:
  </p>
  
  <blockquote class="tr_bq">
    <p>
      fdisk -l&nbsp;
    </p>
  </blockquote>
  
  <div>
    All works good, if you can attach, detach and again attach volume to instance.
  </div>
</div>
