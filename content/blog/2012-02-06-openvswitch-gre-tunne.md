---
title: OpenVswitch GRE tunnel
author: rsokolkov
type: post
date: 2012-02-06T11:25:00+00:00
url: /openvswitch-gre-tunne/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 330272769410124959
blogger_author:
  - 14718283222819047051
blogger_comments:
  - 1
blogger_permalink:
  - /2012/02/openvswitch-gre-tunnel.html
categories:
  - Uncategorized
tags:
  - gre
  - openvswitch
  - ovs

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  For, example i have few&nbsp;virtual machines on my home server and several on my work server. I want that they lived in one distributed ethernet network.</p> 
  
  <p>
    <a href="http://openvswitch.org/">OpenVswitch</a> has implementation for <a href="http://en.wikipedia.org/wiki/Generic_Routing_Encapsulation">GRE</a> tunnels. In our case we will encapsulate all our ethernet traffic over IP.
  </p>
  
  <p>
    My servers on Ubuntu 11.10.
  </p>
  
  <p>
    Home server IP: 1.1.1.1<br /> Work server IP: 2.2.2.2
  </p>
  
  <p>
    On both servers install OVS (OpenVswitch). First install and automatically compile ovs module, then install main packages.
  </p>
  
  <blockquote class="tr_bq">
    <p>
      aptitude install openvswitch-datapath-dkms<br /> aptitude install openvswitch openvswitch-brcompat
    </p>
  </blockquote>
  
  <p>
    Then add brcompat_mod (replace for standart bridge utils) module.<br /> modprobe brcompat_mod
  </p>
  
  <blockquote class="tr_bq">
    <p>
      ovs-brcompatd &#8211;pidfile &#8211;detach
    </p>
  </blockquote>
  
  <pre style="text-align: -webkit-auto; white-space: pre-wrap; word-wrap: break-word;">Add ovs bridge and gre interface</pre>
  
  <pre style="text-align: -webkit-auto; word-wrap: break-word;"><blockquote class="tr_bq">
  ovs-vsctl add-br brs0
</blockquote>

<pre style="word-wrap: break-word;">On work server:</pre>


<blockquote class="tr_bq">
  <p>
    ovs-vsctl add-port brs0 gre0 -- set interface gre0 type=gre options:remote_ip=1.1.1.1
  </p>
</blockquote>


<pre style="word-wrap: break-word;">On home server</pre>


<blockquote class="tr_bq">
  <p>
    ovs-vsctl add-port brs0 gre0 -- set interface gre0 type=gre options:remote_ip=2.2.2.2
  </p>
</blockquote>


<pre style="word-wrap: break-word;">Then you need to add tap interface of your VMs into the bridges</pre>


<blockquote class="tr_bq">
  <p>
    ovs-vsctl add-port brs0 vnet0
  </p>
</blockquote>


<p>
  You don't need to add your uplink interface(eth0) to bridge. Now all VMs will live in single network. Note that GRE doesn't encrypt your traffic.&nbsp;
  </div>