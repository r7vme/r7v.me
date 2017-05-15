---
title: Configuring Openstack images to write in console.log
author: rsokolkov
type: post
date: 2011-11-07T08:56:00+00:00
url: /configuring-openstack-images-to-write/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 2207412970271395681
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2011/11/configuring-openstack-images-to-write.html
categories:
  - Uncategorized
tags:
  - fedora
  - libvirt
  - openstack
  - ubuntu

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  If you want to see booting process and kernel output in openstack console.log file you need to modify kernel params.&nbsp;By default &#8220;<em style="background-color: white; font-family: arial, sans-serif; font-size: small; font-style: normal; font-weight: bold; line-height: 16px; text-align: -webkit-auto;">quiet splash</em>&#8221; in kernel parameters. You need to delete it &nbsp;and add &#8220;console=ttyS0&#8221;. It will output to first serial port console. By default serial port 1 is set in libvirt xml files.</p> 
  
  <p>
    <console type=&#8217;file&#8217;><br /> &nbsp; <source path=&#8217;/mnt/drbd0/nova/instances/instance-00000044/console.log&#8217;/><br /> &nbsp; <target type=&#8217;serial&#8217; port=&#8217;1&#8217;/><br /> </console>
  </p>
  
  <div>
    <b><br /> </b><br /> <b>Ubuntu:</b>
  </div>
  
  <div>
    Edit /etc/default/grub:
  </div>
  
  <blockquote class="tr_bq">
    <p>
      &#8230;.<br /> GRUB_CMDLINE_LINUX_DEFAULT=&#8221;console=ttyS0&#8243;<br /> &#8230;<br /> GRUB_TERMINAL=console<br /> &#8230;
    </p>
  </blockquote>
  
  <p>
    Then type &#8220;update-grub&#8221; to generate new grub.cfg. Tested on Ubuntu 11.04, 11.10
  </p>
  
  <p>
    <b>Fedora:</b><br /> Edit /etc/grub.conf. Remove &#8220;quiet spalsh&#8221; params and add &#8220;console=ttyS0&#8221;. Tested on fedora 14, 15.
  </p>
  
  <p>
    Tested on libvirt-0.9.1-1.fc15.x86_64
  </p>
  
  <p>
    To see what write to file
  </p>
  
  <blockquote class="tr_bq">
    <p>
      du -h /var/lib/nova/instances/instance-00000015/console.log
    </p>
  </blockquote>
</div>