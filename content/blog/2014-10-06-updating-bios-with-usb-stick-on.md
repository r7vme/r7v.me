---
title: Updating BIOS with USB stick on Thinkpad (Linux)
author: rsokolkov
type: post
date: 2014-10-06T07:24:00+00:00
url: /updating-bios-with-usb-stick-on/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 1825769193373235848
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2014/10/updating-bios-with-usb-stick-on.html
categories:
  - Uncategorized
tags:
  - arch
  - lenovo
  - thinkpad
  - thinkwiki
  - update bios

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  Basically Lenovo supports two ways of upgrading BIOS: Windows upgrade utility or burning ISO to CD.<br /> I don&#8217;t have nor Windows nor CD-ROM on my laptop.</p> 
  
  <p>
    Idea is to prepare bootable USB stick from the ISO.
  </p>
  
  <p>
    1) Get the BIOS Update Bootable CD from http://support.lenovo.com (In my case for <a href="http://support.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-t-series-laptops/thinkpad-t530//downloads/DS029249">T530</a>)<br /> 2) Convert ISO to img. This is most important step because. Based on manual from <a href="http://thinkwiki.org/wiki/BIOS_update_without_optical_disk">thinkwiki.org</a>&nbsp;i&#8217;d used<br /> &#8220;geteltorito&#8221; script for convertation. This script supports special&nbsp;harddisk emulation (BootMediaType=4) ISO format.
  </p>
  
  <p>
    wget&nbsp;http://userpages.uni-koblenz.de/~krienke/ftp/noarch/geteltorito/geteltorito<br /> chmod +x geteltorito<br /> ./geteltorito -o bios.img ~/Downloads/g4uj25us.iso
  </p>
  
  <p>
    3) dd image onto USB stick. ( CAREFUL: Use real path to USB instead of /dev/sdX )
  </p>
  
  <p>
    sudo dd if=bios.img of=/dev/sdX bs=512K
  </p>
  
  <p>
    4) Boot from USB and follow the instructions. Also please read official readme before doing any flashing. (i.e. for <a href="http://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles/g4uj25uc.txt">T530</a>)
  </p>
  
  <p>
    NOTES:<br /> &#8211; Make sure USB booting enabled in BIOS. &#8220;Config &#8211;> USB &#8211;> USB UEFI BIOS support&#8221; should be &#8220;Enabled&#8221;<br /> &#8211; After updating firmware i&#8217;ve plunged into <a href="https://bugzilla.kernel.org/show_bug.cgi?id=51231">issue</a> with not workable &#8220;brightness control&#8221; keys. Solution: add kernel paramenter acpi_osi=&#8221;!Windows 2012&#8243;</div>