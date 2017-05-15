---
title: Download all packages from Ubuntu repository
author: rsokolkov
type: post
date: 2015-04-24T11:49:00+00:00
url: /download-all-packages-from-ubuntu/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 5654535871111706533
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2015/04/download-all-packages-from-ubuntu.html
categories:
  - Uncategorized
tags:
  - apt
  - deb
  - repository
  - ubuntu

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  To download all packages from particular repository we can use &#8220;Packages&#8221; file. It contains meta information about every packages in repository.</p> 
  
  <p>
    1) Get particualr &#8220;Packages&#8221; file.
  </p>
  
  <p>
    <b>ls /var/lib/apt/lists/*_Packages</b>
  </p>
  
  <p>
    2) Use &#8220;apt-get download&#8221; to get all packages
  </p>
  
  <p>
    <b>for i in `grep &#8220;Package:&#8221; Packages | awk &#8216;{print $2}&#8217;`; do ${i}_* || apt-get download $i; done</b> 
    
    <div>
    </div>
    
    <div>
      It will download all deb files to current directory.
    </div></div>