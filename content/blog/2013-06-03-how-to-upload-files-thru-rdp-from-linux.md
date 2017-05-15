---
title: How to upload files thru rdp from linux
author: rsokolkov
type: post
date: 2013-06-03T16:55:00+00:00
url: /how-to-upload-files-thru-rdp-from-linux/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 9217871598211793258
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2013/06/how-to-upload-files-thru-rdp-from-linux.html
categories:
  - Uncategorized
tags:
  - rdesktop
  - rdp
  - share
  - ubuntu

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  If you want to copy files from Linux to remote Windows machine you could do it thru RDP (rdesktop utility).</p> 
  
  <div style="text-align: left;">
    rdesktop -g 90% -r disk:mydir=/home/user/mydir 10.0.0.2
  </div>
  
  <div style="text-align: left;">
  </div>
  
  <div style="text-align: left;">
    It will open graphical RDP session and you could see your shared folder from &#8220;My Computer&#8221; page.
  </div>
  
  <div style="text-align: left;">
  </div>
</div>