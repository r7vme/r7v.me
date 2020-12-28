---
draft: true
title: 'OpenStack Liberty features [quick note for myself]'
author: rsokolkov
type: post
date: 2015-09-29T11:54:48+00:00
url: /openstack-liberty-features-quick-note-for-myself/
categories:
  - Uncategorized
tags:
  - keystone
  - liberty
  - mirantis
  - neutron
  - nova
  - openstack

---
Most interesting things from Mirantis post about OpenStack Liberty

https://www.mirantis.com/blog/53-things-new-openstack-liberty/

Nova

  * NFV [OPNFV][1]
  * Improved Cells

Neutron

  * IPv6: extended
  * IPAM: Pluggable
  * LBaaS: VM-based load balancers implemented with [Octavia][2]!!! (Bluebox driver via Octabvia?)
  * [RBAC][3]: Share networks between specific tenants via API Cinder
  * Caching images: Improves speed boot from volume (good for Vmware driver?)

Glance

  * Image verification: Sign your image

Keystone

  * WebSSO for IDPs (Makes federation easier)

Horizon

  * Improved launch wizard and network page (UX)
  * Control IDP-specific WebSSO from Horizon (Hybrid clouds)

Ceilometer

  * Create new meters with YAML
  * Performance: Compute agent has in memory cache to not pull nova API
  * Gnocchi(TDBaaS): \*\*Will it resolve Ceilometer storage issues???\*\**

 [1]: https://www.opnfv.org/
 [2]: http://www.octavia.io/review/master/design/version0.5/component-design.html
 [3]: http://specs.openstack.org/openstack/neutron-specs/specs/liberty/rbac-networks.html
