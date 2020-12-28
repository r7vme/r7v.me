---
draft: true
title: Elementary iptables MASQUERADE
author: rsokolkov
type: post
date: 2013-05-15T14:57:00+00:00
url: /elementary-iptables-masquerade/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 7108692751266819686
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2013/05/elementary-iptables-masquerade.html
categories:
  - Uncategorized
tags:
  - iptables
  - nat
  - ubuntu

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  <ol style="text-align: left;">
    <li>
      echo &#8220;1&#8221; > /proc/sys/net/ipv4/ip_forward
    </li>
    <li>
      iptables -t nat -A POSTROUTING -s 10.0.0.0/24 ! -d 10.20.0.0/24 -j MASQUERADE
    </li>
  </ol>
</div>
