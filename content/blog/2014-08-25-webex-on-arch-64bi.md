---
title: Webex on Arch (64bit)
author: rsokolkov
type: post
date: 2014-08-25T12:18:00+00:00
url: /webex-on-arch-64bi/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 7258529276705570660
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2014/08/webex-on-arch-64bit.html
categories:
  - Uncategorized

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  The main aim of this post just to help with installing webex on 64bit Arch by <a href="http://pond-weed.com/webex/index.html" target="_blank">this method</a>. Unfortunately package is outdated. Latest [Nov 12] version of archive could be found <a href="https://www.dropbox.com/s/jsrbs07t5545x03/firefox32-20141112-1.src.tar.gz?dl=0" target="_blank">here</a>.</p> 
  
  <h4 style="text-align: left;">
    So to build from sources:
  </h4>
  
  <p>
    wget https://www.dropbox.com/s/jsrbs07t5545x03/firefox32-20141112-1.src.tar.gz?dl=1 -O firefox32-20140714-1.src.tar.gz<br /> tar xf firefox32-20140714-1.src.tar.gz && cd firefox32<br /> sudo makepkg -s<br /> sudo pacman -U&nbsp;firefox32-20140714-1-x86_64.pkg.tar.xz
  </p>
  
  <p>
  </p>
  
  <h4 style="text-align: left;">
    To start 32-bit firefox:
  </h4>
  
  <p>
    firefox32
  </p>
</div>