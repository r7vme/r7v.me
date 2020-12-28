---
draft: true
title: Open port with firewalld (systemd)
author: rsokolkov
type: post
date: 2015-07-04T12:04:00+00:00
url: /open-port-with-firewalld-systemd/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 6987419994268814216
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2015/07/open-port-with-firewalld-systemd.html
categories:
  - Uncategorized
tags:
  - fedora
  - firewalld
  - iptables
  - systemd

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  Just reminder for myself to start looking into this new[good or bad?] systemd stuff.</p> 
  
  <p>
    For now, just opening TCP port:
  </p>
  
  <blockquote class="tr_bq">
    <p>
      firewall-cmd &#8211;permanent &#8211;add-port=16514/tcp<br />firewall-cmd &#8211;reload
    </p>
  </blockquote>
</div>
