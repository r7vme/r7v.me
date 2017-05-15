---
title: 'Keystone. Synchronize users from AD to OpenLDAP [python script]'
author: rsokolkov
type: post
date: 2015-03-21T08:47:00+00:00
url: /keystone-synchronize-users-from-ad-to/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 5735774697488533521
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2015/03/keystone-synchronize-users-from-ad-to.html
categories:
  - Uncategorized
tags:
  - ad
  - keystone
  - ldap
  - openstack
  - python-ldap

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  With OpenStack i need to sync users from corporate Microsoft Active Directory to OpenLDAP managed by Keystone.</p> 
  
  <p>
    As input i have list of user DNs. Script syncs only particular user parameters, such as
  </p>
  
  <ul style="text-align: left;">
    <li>
      objectclass
    </li>
    <li>
      mail
    </li>
    <li>
      cn
    </li>
    <li>
      givenName
    </li>
    <li>
      sn
    </li>
    <li>
      uid
    </li>
    <li>
      userPassword
    </li>
    <li>
      carLicense
    </li>
  </ul>
  
  <p>
    These parameters a minimum enough for Keystone.
  </p>
  
  <p>
    Usage:<br /> 1) Make sure you have &#8220;python-ldap&#8221; installed<br /> 2) Prepare &#8220;users&#8221; file with list of DNs in source AD
  </p>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    CN=user1,OU=USERS,DC=EXAMPLE,DC=com
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    CN=user2,OU=OTHER,OU=USERS,DC=EXAMPLE,DC=com
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    3) Start script below
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    ./sync_users.py &#8211;users_file users
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#8211;src_ldap_uri&nbsp;ldap://192.168.0.11:389
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#8211;src_ldap_user&nbsp;&#8216;DOMAINadministrator&#8217;
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#8211;src_ldap_pass &#8216;xxx&#8217;
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#8211;dst_ldap_uri &#8216;ldap://10.0.0.11&#8217;
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#8211;dst_ldap_user&nbsp;&#8216;cn=admin,dc=domain,dc=tld&#8217;
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#8211;dst_ldap_pass xxx
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#8211;dst_ldap_tree &#8216;ou=Users,dc=domain,dc=tld&#8217;
  </div>
  
  <div class="line number2 index1 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
  </div>
  
  <div class="line number1 index0 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    #!/usr/bin/python
  </div>
  
  <div class="line number2 index1 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    import&nbsp;ldap
  </div>
  
  <div class="line number3 index2 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    import&nbsp;ldap.modlist as modlist
  </div>
  
  <div class="line number4 index3 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    import&nbsp;argparse
  </div>
  
  <div class="line number5 index4 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number6 index5 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number7 index6 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser&nbsp;=&nbsp;argparse.ArgumentParser()
  </div>
  
  <div class="line number8 index7 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;users_file&#8217;, default=&#8217;users&#8217;)
  </div>
  
  <div class="line number9 index8 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;src_ldap_uri&#8217;, required=True)
  </div>
  
  <div class="line number10 index9 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;src_ldap_user&#8217;, required=True)
  </div>
  
  <div class="line number11 index10 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;src_ldap_pass&#8217;, required=True)
  </div>
  
  <div class="line number12 index11 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;dst_ldap_uri&#8217;, required=True)
  </div>
  
  <div class="line number13 index12 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;dst_ldap_user&#8217;, required=True)
  </div>
  
  <div class="line number14 index13 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;dst_ldap_pass&#8217;, required=True)
  </div>
  
  <div class="line number15 index14 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    parser.add_argument(&#8216;&#8211;dst_ldap_tree&#8217;, required=True)
  </div>
  
  <div class="line number16 index15 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    args&nbsp;=&nbsp;parser.parse_args()
  </div>
  
  <div class="line number17 index16 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number18 index17 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number19 index18 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    USERS_FILE&nbsp;=&nbsp;args.users_file
  </div>
  
  <div class="line number20 index19 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    SRC_LDAP_URI&nbsp;=&nbsp;args.src_ldap_uri
  </div>
  
  <div class="line number21 index20 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    SRC_LDAP_USER&nbsp;=&nbsp;args.src_ldap_user
  </div>
  
  <div class="line number22 index21 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    SRC_LDAP_PASS&nbsp;=&nbsp;args.src_ldap_pass
  </div>
  
  <div class="line number23 index22 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    DST_LDAP_URI&nbsp;=&nbsp;args.dst_ldap_uri
  </div>
  
  <div class="line number24 index23 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    DST_LDAP_USER&nbsp;=&nbsp;args.dst_ldap_user
  </div>
  
  <div class="line number25 index24 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    DST_LDAP_PASS&nbsp;=&nbsp;args.dst_ldap_pass
  </div>
  
  <div class="line number26 index25 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    DST_LDAP_USER_TREE&nbsp;=&nbsp;args.dst_ldap_tree
  </div>
  
  <div class="line number27 index26 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number28 index27 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number29 index28 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    def&nbsp;prepare_attrs(src_attrs):
  </div>
  
  <div class="line number30 index29 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs&nbsp;=&nbsp;{}
  </div>
  
  <div class="line number31 index30 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;objectclass&#8217;]&nbsp;=&nbsp;[&#8216;top&#8217;,&#8217;inetOrgPerson&#8217;,&#8217;organizationalPerson&#8217;,&#8217;person&#8217;]
  </div>
  
  <div class="line number32 index31 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;mail&#8217;]&nbsp;=&nbsp;src_attrs[&#8220;mail&#8221;]
  </div>
  
  <div class="line number33 index32 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;cn&#8217;]&nbsp;=&nbsp;&nbsp;src_attrs[&#8220;cn&#8221;]
  </div>
  
  <div class="line number34 index33 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;givenName&#8217;]&nbsp;=&nbsp;src_attrs[&#8220;givenName&#8221;]
  </div>
  
  <div class="line number35 index34 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;sn&#8217;]&nbsp;=&nbsp;src_attrs[&#8220;sAMAccountName&#8221;]
  </div>
  
  <div class="line number36 index35 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;uid&#8217;]&nbsp;=&nbsp;src_attrs[&#8220;sAMAccountName&#8221;]
  </div>
  
  <div class="line number37 index36 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;userPassword&#8217;]&nbsp;=&nbsp;&#8216;{SASL}%s&#8217;&nbsp;%&nbsp;src_attrs[&#8220;mail&#8221;]
  </div>
  
  <div class="line number38 index37 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;attrs[&#8216;carLicense&#8217;]&nbsp;=&nbsp;&#8216;TRUE&#8217;
  </div>
  
  <div class="line number39 index38 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;attrs
  </div>
  
  <div class="line number40 index39 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number41 index40 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    src_ldap&nbsp;=&nbsp;ldap.initialize(SRC_LDAP_URI)
  </div>
  
  <div class="line number42 index41 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    src_ldap.simple_bind_s(SRC_LDAP_USER, SRC_LDAP_PASS)
  </div>
  
  <div class="line number43 index42 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number44 index43 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number45 index44 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    dst_ldap&nbsp;=&nbsp;ldap.initialize(DST_LDAP_URI)
  </div>
  
  <div class="line number46 index45 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    dst_ldap.simple_bind_s(DST_LDAP_USER, DST_LDAP_PASS)
  </div>
  
  <div class="line number47 index46 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number48 index47 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number49 index48 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    with&nbsp;open(USERS_FILE) as f:
  </div>
  
  <div class="line number50 index49 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;users_to_sync&nbsp;=&nbsp;f.read().splitlines()
  </div>
  
  <div class="line number51 index50 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number52 index51 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number53 index52 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    for&nbsp;user_dn&nbsp;in&nbsp;users_to_sync:
  </div>
  
  <div class="line number54 index53 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;user_cn&nbsp;=&nbsp;user_dn.split(&#8216;,&#8217;)[0]
  </div>
  
  <div class="line number55 index54 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;user_tree&nbsp;=&nbsp;user_dn.split(&#8216;,&#8217;,&nbsp;1)[1]
  </div>
  
  <div class="line number56 index55 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;user&nbsp;=&nbsp;src_ldap.search_s(user_tree, ldap.SCOPE_ONELEVEL, user_cn)
  </div>
  
  <div class="line number57 index56 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;user:
  </div>
  
  <div class="line number58 index57 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dn&nbsp;=&nbsp;&#8220;cn=%s,%s&#8221;&nbsp;%&nbsp;(user_cn, DST_LDAP_USER_TREE)
  </div>
  
  <div class="line number59 index58 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ldif&nbsp;=&nbsp;modlist.addModlist(prepare_attrs(user[0][1]))
  </div>
  
  <div class="line number60 index59 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:
  </div>
  
  <div class="line number61 index60 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dst_ldap.add_s(dn,ldif)
  </div>
  
  <div class="line number62 index61 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print&nbsp;&#8220;Synced user %s&#8221;&nbsp;%&nbsp;user[0][0]
  </div>
  
  <div class="line number63 index62 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except&nbsp;ldap.ALREADY_EXISTS:
  </div>
  
  <div class="line number64 index63 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print&nbsp;&#8220;User %s already exists&#8221;&nbsp;%&nbsp;user[0][0]
  </div>
  
  <div class="line number65 index64 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number66 index65 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    &nbsp;
  </div>
  
  <div class="line number67 index66 alt2" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    src_ldap.unbind_s()
  </div>
  
  <div class="line number68 index67 alt1" style="background: none rgb(255, 255, 255) !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    dst_ldap.unbind_s()
  </div>
</div>