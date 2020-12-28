---
draft: true
title: Replace dns server in running app
author: rsokolkov
type: post
date: 2016-10-11T17:26:13+00:00
url: /replace-dns-server-in-running-app/
categories:
  - Uncategorized
tags:
  - gdb
  - python
  - troubleshooting

---
### Problem description

Let&#8217;s say you have an app or script that does some network activity. Your app probably uses DNS names. Okay, how system will resolve DNS name. Right, it will check resolv.conf for DNS servers. What will happen if you replace DNS server? Will your app catch this changes? Short answer for CentOS NO. In Ubuntu they fixed this.

Issue here that libc&#8217;s &#8220;getaddrinfo&#8221; caches DNS configuration and requires calling special function &#8220;res_init&#8221; to reread resolv.conf. See [bug][1] for more details.

How can i replace DNS server for running application?
  
Option #1: call res_init (here i failed, mb someone can advice?)
  
Option #2: replace DNS server address in runtime sctructure

### Replace dns server in running app

Add debug info repo
  
<https://wiki.centos.org/AdditionalResources/Repositories/DebugInfo>

Install debug files (Versions glibc and glibc-debuginfo should be the same)

    debuginfo-install glibc python
    

Start debugger

    gdb python <PID>
    

Replace dns server with 8.8.8.8

    b getaddrinfo
    c
    print _res.nsaddr_list.sin_addr.s_addr
    set _res.nsaddr_list.sin_addr.s_addr = 134744072
    del 1
    quit
    

To convert IP addess

<pre><code class="python">import socket, struct
struct.unpack('!L', socket.inet_aton('1.0.20.10')) # IP address should be reverted
</code></pre>

 [1]: https://sourceware.org/bugzilla/show_bug.cgi?id=3675
