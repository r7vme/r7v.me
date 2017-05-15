---
title: Chrome crashing…fixed
author: rsokolkov
type: post
date: 2015-08-17T14:50:19+00:00
url: /chrome-crashing-fixed/
categories:
  - Uncategorized
tags:
  - arch
  - awesome
  - chrome crashing
  - chromium
  - gtk

---
This issue annoyed me for a while&#8230; finally i&#8217;ve got it fixed.

## The issue:

**Chrome/Chromium crashes** on file dialog opening after any desktop notification.

In dmesg

<pre>[ 5496.605768] chrome[1107]: segfault at 30 ip 00007fd755d2ec36 sp 00007ffd7e7ea8c0 error 4 in libgtk-x11-2.0.so.0.2400.28[7fd755a70000+434000]</pre>

## Fix:

Gtk2 was guilty. Here is the [bug][1].

**Rebuilt gtk2 with this [patch][2].** (For arch using [ABS][3])

 [1]: https://bugzilla.gnome.org/show_bug.cgi?id=747280
 [2]: https://bug747280.bugzilla-attachments.gnome.org/attachment.cgi?id=300866
 [3]: https://wiki.archlinux.org/index.php/Arch_Build_System