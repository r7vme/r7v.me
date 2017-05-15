---
title: 'Deploy Openstack by FUEL on libvirt: pre-install network configuration'
author: rsokolkov
type: post
date: 2013-10-29T17:39:00+00:00
url: /deploy-openstack-by-fuel-on-libvir/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 9167885246346807956
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2013/10/deploy-openstack-by-fuel-on-libvirt.html
categories:
  - Uncategorized
tags:
  - fuel
  - libvirt
  - networking
  - openstack

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  Mirantis has released <a href="http://software.mirantis.com/" target="_blank">FUEL 3.2 </a>deployment automation tool for OpenStack. It has a lot of <a href="http://docs.mirantis.com/fuel/fuel-3.2/" target="_blank">documentation</a> and <a href="http://software.mirantis.com/quick-start/" target="_blank">QuickStart scripts for VirtualBox</a>, but if you prefer libvirt or may be pure KVM, you probably plunge into networking issues or need to read and understand fuel networking. I&#8217;ll try to explain quick way&nbsp; how to prepare networking on linux box for FUEL 3.2.</p> 
  
  <p>
    Fuel 3.2 uses 5 networks by default:
  </p>
  
  <ul style="text-align: left;">
    <li>
      FUEL- pxe and puppet &#8211; 10.20.0.0/24
    </li>
    <li>
      PUBLIC &#8211; public APIs and floating range &#8211; 172.16.0.0/24 (VLAN 100) &#8211; internet access
    </li>
    <li>
      MANAGEMENT &#8211; internal OpenStack communications &#8211;&nbsp; 192.168.0.0/24 (VLAN 101)
    </li>
    <li>
      STORAGE &#8211; iscsi, swift &#8211; 192.168.1.0/24 (VLAN 102)
    </li>
    <li>
      FIXED &#8211; for openstack projects &#8211; 10.0.0.0/16 (VLAN 103 or VLAN range)
    </li>
  </ul>
  
  <div style="text-align: left;">
    You could cultivate all networks in single linux bridge. But it need some magic like routing, NAT and DNS.
  </div>
  
  <div style="text-align: left;">
  </div>
  
  <div style="text-align: left;">
  </div>
  
  <div style="text-align: left;">
  </div>
  
  <div style="text-align: left;">
    <br /> 1) create bridge<br /> brctl addbr br0<br /> ip link set up dev br0</p> 
    
    <p>
      2) add address and DNS forwarding server. 10.20.0.1 is used by default as dns server.<br /> ip addr add 10.20.0.1/24 dev br0<br /> dnsmasq -a 10.20.0.1
    </p>
    
    <p>
      3) add VLAN interface, add gateway and configure NAT for PUBLIC network<br /> ip link add link br0 name br0.100 type vlan id 100<br /> ip link set up br0.100<br /> ip addr add 172.16.0.1/24 dev br0.100<br /> iptables -t nat -A POSTROUTING -s 172.16.0.0/24 ! -d 172.16.0.0/24 -j MASQUERADE
    </p>
    
    <p>
      4) You should create VMs w/ <b>single</b> interface attached to br0.</div> 
      
      <div style="text-align: left;">
      </div>
      
      <div style="text-align: left;">
        After that install Fuel master node from iso. And follow steps in <a href="http://docs.mirantis.com/fuel/fuel-3.2/pdf/Fuel-for-Openstack-3.2-InstallGuide.pdf" target="_blank">documentation</a>.
      </div></div>