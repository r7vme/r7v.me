---
title: AAAhhh! Recovering after “dd”!!!
author: rsokolkov
type: post
date: 2014-05-07T05:06:00+00:00
url: /aaahhh-recovering-after-dd/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 4119819948997434894
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2014/05/aaahhh-recovering-after-dd.html
categories:
  - Uncategorized
tags:
  - arch
  - dd
  - fdisk
  - kiss
  - syslinux

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  <b>dd if=/dev/zero of=/dev/sda bs=1M</b></p> 
  
  <p>
    Yeeeah, i did it on my laptop (F**n copy-pasting):
  </p>
  
  <p>
    Ctrl+C after 1sec and <b>~700MB zeroed</b>. Perfect evening!!!
  </p>
  
  <p>
    But system is still alive. So no problem, let&#8217;s start:
  </p>
  
  <p>
    #0 I&#8217;m lucky, because 700MB equal &#8220;sda1 (/boot) + part of sda2 (old Ubuntu partition, i don&#8217;t need it). My root (sda5 with Arch) not affected. I need to recover partition table itself and &#8220;/boot&#8221;.
  </p>
  
  <p>
    <b>#1 Old partition table still in memory</b><br /> cat /proc/partitions &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[23:32:52]<br /> major minor &nbsp;#blocks &nbsp;name
  </p>
  
  <p>
    &nbsp;179 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;1966080 mmcblk0<br /> &nbsp;179 &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; &nbsp;1965952 mmcblk0p1<br /> &nbsp; &nbsp;8 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;488386584 sda<br /> &nbsp; &nbsp;8 &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; &nbsp; 194560 sda1<br /> &nbsp; &nbsp;8 &nbsp; &nbsp; &nbsp; &nbsp;2 &nbsp;195221504 sda2<br /> &nbsp; &nbsp;8 &nbsp; &nbsp; &nbsp; &nbsp;3 &nbsp; &nbsp; 976896 sda3<br /> &nbsp; &nbsp;8 &nbsp; &nbsp; &nbsp; &nbsp;4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 sda4<br /> &nbsp; &nbsp;8 &nbsp; &nbsp; &nbsp; &nbsp;5 &nbsp;104856576 sda5<br /> &nbsp; &nbsp;8 &nbsp; &nbsp; &nbsp; &nbsp;6 &nbsp;187133976 sda6<br /> &nbsp;254 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; 36700160 dm-0<br /> &nbsp;254 &nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; 31457280 dm-1<br /> &nbsp;254 &nbsp; &nbsp; &nbsp; &nbsp;2 &nbsp; 31457280 dm-2<br /> &nbsp;254 &nbsp; &nbsp; &nbsp; &nbsp;3 &nbsp; 20971520 dm-3
  </p>
  
  <p>
    <b>#2 Recreating same partition table with fdisk</b><br /> fdisk /dev/sda
  </p>
  
  <p>
    &#8220;o&#8221; &nbsp; create a new empty DOS partition table<br /> &#8220;n&#8221; &nbsp; add a new partition. For Last sector use +<BLOCKs from /proc/partitions>
  </p>
  
  <p>
    After double (or more) checking:<br /> &#8220;w&#8221; &nbsp; write table to disk and exit
  </p>
  
  <p>
    <b>#3 recovering /boot</b><br /> unmount /boot<br /> mkfs.ext2 /dev/sda1<br /> mount /boot<br /> WARN: Special for Arch only (https://wiki.archlinux.org/index.php/syslinux)<br /> pacman -U /var/cache/pacman/pkg/linux-3.13.8-1-x86_64.pkg.tar.xz<br /> pacman -U /var/cache/pacman/pkg/syslinux-6.02-8-x86_64.pkg.tar.xz<br /> syslinux-install_update -i -a -m<br /> vim&nbsp;/boot/syslinux/syslinux.cfg <&#8211; Set right root partition to sda5
  </p>
  
  <p>
    That&#8217;s it. And&nbsp;<a href="http://en.wikipedia.org/wiki/KISS_principle" target="_blank">KISS</a> for everyone.
  </p>
  
  <div>
  </div>
</div>