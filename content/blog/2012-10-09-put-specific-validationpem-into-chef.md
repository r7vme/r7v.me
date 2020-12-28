---
draft: true
title: Put a specific validation.pem into chef-server
author: rsokolkov
type: post
date: 2012-10-09T11:39:00+00:00
url: /put-specific-validationpem-into-chef/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 4915564597459162210
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2012/10/put-specific-validationpem-into-chef.html
categories:
  - Uncategorized
tags:
  - chef

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  I want to put specific validation.pem into fresh chef-server installation. This will be useful if you have some predefined nodes, or kickstart files with specific validation.pem inside and want to boot fresh chef-server installation.</p> 
  
  <p>
    1. Generate public key from my-validation.pem
  </p>
  
  <p>
    # openssl rsa -in my-validation.pem -pubout > key.pub
  </p>
  
  <p>
    2. Goes to&nbsp;<a href="http://127.0.0.1:5984/_utils/database.html?chef/_design/clients/_view/all">http://127.0.0.1:5984/_utils/database.html?chef/_design/clients/_view/all</a>
  </p>
  
  <p>
    Click on chef-validator, then double click on public_key value. And paste contents of key.pub. Do not forget to push &#8220;Save Document&#8221; in the top left corner.
  </p>
  
  <p>
    3. Replace /etc/chef/validation.pem with your my-validation.pem
  </p>
  
  <p>
    mv /etc/chef/validation.pem&nbsp;/etc/chef/validation-old.pem<br /> mv my-validation.pem&nbsp;/etc/chef/validation.pem
  </p>
  
  <p>
    Now you be able to register new nodes with your validation.pem
  </p>
</div>
