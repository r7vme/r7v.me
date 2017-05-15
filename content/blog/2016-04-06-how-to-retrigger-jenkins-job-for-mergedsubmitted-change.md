---
title: How to retrigger Jenkins job for merged/submitted change?
author: rsokolkov
type: post
date: 2016-04-06T17:05:36+00:00
url: /how-to-retrigger-jenkins-job-for-mergedsubmitted-change/
categories:
  - Uncategorized
tags:
  - ci
  - gerrit
  - jenkins

---
We have Jenkins job that builds packages from git repository. Gerrit plugin for Jenkins triggers build on code merge. At some point CI was broken and some changes were merged, but package was not built.

#### Add &#8220;Patchset created&#8221; trigger to your job

Make sure other jobs with &#8220;Patchset created &#8220;trigger disabled.

[<img src="/uploads/2016/04/2016-04-06-194440-screenshot.png" alt="2016-04-06-19:44:40-screenshot" width="603" height="304" class="alignnone size-full wp-image-181" srcset="/uploads/2016/04/2016-04-06-194440-screenshot.png 603w, /uploads/2016/04/2016-04-06-194440-screenshot-300x151.png 300w" sizes="(max-width: 603px) 100vw, 603px" />][1]

<!--more-->

#### Go to Jenkins home and push &#8220;Query and trigger Gerrit Patches&#8221;

[<img src="/uploads/2016/04/2016-04-06-194135-screenshot-256x300.png" alt="2016-04-06-19:41:35-screenshot" width="256" height="300" class="alignnone size-medium wp-image-178" srcset="/uploads/2016/04/2016-04-06-194135-screenshot-256x300.png 256w, /uploads/2016/04/2016-04-06-194135-screenshot.png 375w" sizes="(max-width: 256px) 100vw, 256px" />][2]

#### Search all merged changes

[<img src="/uploads/2016/04/2016-04-06-194211-screenshot.png" alt="2016-04-06-19:42:11-screenshot" width="557" height="236" class="alignnone size-full wp-image-179" srcset="/uploads/2016/04/2016-04-06-194211-screenshot.png 557w, /uploads/2016/04/2016-04-06-194211-screenshot-300x127.png 300w" sizes="(max-width: 557px) 100vw, 557px" />][3]

#### Select target change and push &#8220;Trigger selected&#8221;

[<img src="/uploads/2016/04/2016-04-06-194256-screenshot.png" alt="2016-04-06-19:42:56-screenshot" width="362" height="186" class="alignnone size-full wp-image-183" srcset="/uploads/2016/04/2016-04-06-194256-screenshot.png 362w, /uploads/2016/04/2016-04-06-194256-screenshot-300x154.png 300w" sizes="(max-width: 362px) 100vw, 362px" />][4]

**Do not forget to revent job changes.**

 [1]: /uploads/2016/04/2016-04-06-194440-screenshot.png
 [2]: /uploads/2016/04/2016-04-06-194135-screenshot.png
 [3]: /uploads/2016/04/2016-04-06-194211-screenshot.png
 [4]: /uploads/2016/04/2016-04-06-194256-screenshot.png
