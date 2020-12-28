---
draft: true
title: Cassandra state detected DOWN
author: rsokolkov
type: post
date: 2015-09-14T14:39:56+00:00
url: /cassandra-state-detected-down/
categories:
  - Uncategorized
tags:
  - cassandra
  - contrail
  - juniper
  - opencontrail
  - upgrade contrail

---
# Issue

While upgrading Contrail from 2.0 to 2.20 i&#8217;ve stuck with error.

<pre># contrail-status
...
contrail-database-nodemgr initializing <strong>(Cassandra state detected DOWN.)</strong>
....</pre>

# Following the trail with contrail-status

1) &#8220;contrail-status&#8221; is **JUST** python script located in /usr/bin/contrail-status
  
2) It asks supervisord about services

<pre>supervisorctl -s unix:///tmp/supervisord_database.sock status
contrail-database RUNNING pid 9262, uptime 3 days, 4:15:59
contrail-database-nodemgr RUNNING pid 6043, uptime 0:10:51
</pre>

3) Then it checks URL for every service

<pre>curl http://localhost:8103/Snh_SandeshUVECacheReq?x=NodeStatus
</pre>

4) Parses ProcessStatus

<pre>&lt;ProcessStatus&gt;
  &lt;module_id type="string" identifier="1"&gt;contrail-database-nodemgr&lt;/module_id&gt;
  &lt;instance_id type="string" identifier="2"&gt;0&lt;/instance_id&gt;
  &lt;state type="string" identifier="3"&gt;<strong>Non-Functional</strong>&lt;/state&gt;
  &lt;description type="string" identifier="5"&gt;<strong>Cassandra state detected DOWN</strong>.&lt;/description&gt;
&lt;/ProcessStatus&gt;
</pre>

## **Why contrail-database-nodemgr gives &#8220;Non-Functional&#8221;???**

<!--more-->

I&#8217;ve found that &#8220;Cassandra state detected DOWN&#8221; is &#8220;FAIL\_STATUS\_SERVER_PORT&#8221; error type.  Contrail getting this error <a href="https://github.com/Juniper/contrail-controller/blob/R2.20/src/nodemgr/database_event_manager.py#L193-L198" target="_blank">HERE</a> in code. So command below fails for some reason.

<pre>cassandra-cli --host 127.0.0.1 --batch &lt; /dev/null| grep 'Connected to:
</pre>

Cassandra listens ONLY ON management IP (not 127.0.0.1).

<pre># netstat -lnptu|grep 9160
tcp        0      0 172.17.0.8:9160         0.0.0.0:*               LISTEN      9262/java
</pre>

## FIX

We need to add following into &#8220;/etc/contrail/contrail-database-nodemgr.conf&#8221;

<pre>[DEFAULT]
hostip=172.17.0.8
</pre>

Restart nodemgr

<pre>supervisorctl -s unix:///tmp/supervisord_database.sock restart contrail-database-nodemgr
</pre>
