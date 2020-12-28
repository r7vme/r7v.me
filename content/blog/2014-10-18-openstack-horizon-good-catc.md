---
draft: true
title: OpenStack Horizon good catch
author: rsokolkov
type: post
date: 2014-10-18T07:02:00+00:00
url: /openstack-horizon-good-catc/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 3516318077277992480
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2014/10/openstack-horizon-good-catch.html
categories:
  - Uncategorized
tags:
  - cloud
  - horizon
  - keystone
  - openstack
  - pki
  - pkiz
  - token

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  TL;DR</p> 
  
  <p>
    Wanna share my joy, i always want to finish _debugging_ with awesome oneline fix&#8230;<a href="https://review.openstack.org/#/c/101089/2/openstack_auth/user.py">this is it</a>.
  </p>
  
  <p>
    We&#8217;r doing multi-regional OpenStack across at least 7 datacenters. <a href="https://www.mirantis.com/blog/understanding-openstack-authentication-keystone-pki/">PKI tokens</a> are really good for such kind of deployments.
  </p>
  
  <p>
    &#8211; No token storage required. (except&nbsp;non-critical&nbsp;token hashes)<br /> &#8211; Token verification without keystone
  </p>
  
  <p>
    Unfortunately cons of this approach that token are pretty big ~8Kbytes. At least full catalog packed into token. Finally we&#8217;r using&nbsp;<a href="https://blueprints.launchpad.net/keystone/+spec/compress-tokens">PKIZ</a> (compressed PKI) to decrease the size (Backported to Icehouse from Juno).
  </p>
  
  <p>
    All works like a charm&#8230;before today after adding one more region.&nbsp;We&#8217;ve noticed that Horizon stopped to show &#8220;Project&#8221; tab nor any additional tenants for user.&nbsp;From CLI all works perfectly.
  </p>
  
  <p>
    <b>Error: &nbsp;Request attribute token must be less than or equal to 8192.</b>
  </p>
  
  <p>
    Finally found that we&#8217;r affected by this <a href="https://bugs.launchpad.net/horizon/+bug/1331406" style="font-family: inherit;">bug</a>.&nbsp;Horizon while getting project list tries to send _full_ token instead of id (md5 hash) that&#8217;s why token not fits into 8K.
  </p>
  
  <p>
    The simplest workaround (not the solution) was to increase keystone &#8220;max_token_size&#8221;. My challenge was to not finish on this easy workaround and continue to dig deeper.
  </p>
  
  <p>
    P.S.: My&nbsp;uncompressed&nbsp;token was 8.5K (88 endpoints)<br /> P.S.S.: Large OpenStack community has it&#8217;s benefits: in 80% cases someone already plunged into your issue and filled a bug .
  </p>
  
  <p>
    </div>
