---
title: Synchronizing users with LSC-project
author: rsokolkov
type: post
date: 2015-03-21T09:21:00+00:00
url: /synchronizing-users-from-ad-to-openldap/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 5140582889950436363
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2015/03/synchronizing-users-from-ad-to-openldap.html
categories:
  - Uncategorized
tags:
  - ad
  - java
  - ldap
  - lsc-project
  - openstack

---
<div dir="ltr" style="text-align: left;">
  <div style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px;">
  </div>
  
  <div style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px;">
    This post includes:
  </div>
  
  <div style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px;">
    &#8211; LSC-project installation
  </div>
  
  <div style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px;">
    &#8211; Preparing lsc.xml
  </div>
  
  <div style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px;">
    &#8211; saslauthd installation
  </div>
</div>

<div style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px;">
</div>

<!--more-->

<div dir="ltr" style="text-align: left;">
  <div style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px;">
  </div>
  
  <h1 style="background-color: white; color: #333333; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; padding: 0px; text-align: left;">
    LSC-project installation
  </h1>
  
  <div>
    <div class="line number1 index0 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      For Ubuntu 12.04.
    </div>
    
    <div class="line number1 index0 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    </div>
    
    <div class="line number1 index0 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      cat < EOF >> /etc/apt/sources.list.d/lsc-project.list
    </div>
    
    <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        deb     http://lsc-project.org/debian lsc main
      </div>
      
      <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        deb-src http://lsc-project.org/debian lsc main
      </div>
    </div>
    
    <div class="line number5 index4 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      EOF
    </div>
    
    <div class="line number6 index5 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      wget -O &#8211; http://ltb-project.org/wiki/lib/RPM-GPG-KEY-LTB-project | sudo apt-key add &#8211;
    </div>
    
    <div class="line number7 index6 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      apt-get update && apt-get install lsc
    </div>
    
    <div class="line number8 index7 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      apt-get install openjdk-6-jre
    </div>
    
    <div class="line number10 index9 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      mkdir /etc/lsc/ad-to-ldap
    </div>
    
    <div class="line number11 index10 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      cp /etc/lsc/logback.xml /etc/lsc/ad-to-ldap/logback.xml
    </div>
  </div>
  
  <div class="line number11 index10 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
  </div>
  
  <h4 style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; text-align: left; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    Preparing lsc.xml
  </h4>
  
  <div>
  </div>
  
  <div>
    You want to modify at least:
  </div>
  
  <div>
    &#8211; ldapConection (Both source and dest)
  </div>
  
  <div>
    &#8211; baseDN
  </div>
  
  <div>
    &#8211; password
  </div>
  
  <div>
  </div>
  
  <div>
    Put xml below to /etc/lsc/ad-to-ldap/lsc.xml
  </div>
  
  <div>
  </div>
  
  <div>
    <div>
      <?xml version=&#8221;1.0&#8243;?>
    </div>
    
    <div>
      <lsc xmlns=&#8221;http://lsc-project.org/XSD/lsc-core-2.1.xsd&#8221; revision=&#8221;0&#8243;>
    </div>
    
    <div>
        <connections>
    </div>
    
    <div>
          <ldapConnection>
    </div>
    
    <div>
            <name>dst-ldap</name>
    </div>
    
    <div>
            <url>ldap://10.20.0.3:389/DC=domain,DC=tld</url>
    </div>
    
    <div>
            <username>cn=admin,DC=domain,DC=tld</username>
    </div>
    
    <div>
            <password>xxx</password>
    </div>
    
    <div>
            <authentication>SIMPLE</authentication>
    </div>
    
    <div>
            <referral>IGNORE</referral>
    </div>
    
    <div>
            <derefAliases>NEVER</derefAliases>
    </div>
    
    <div>
            <version>VERSION_3</version>
    </div>
    
    <div>
            <pageSize>-1</pageSize>
    </div>
    
    <div>
            <factory>com.sun.jndi.ldap.LdapCtxFactory</factory>
    </div>
    
    <div>
            <tlsActivated>false</tlsActivated>
    </div>
    
    <div>
            <saslMutualAuthentication>false</saslMutualAuthentication>
    </div>
    
    <div>
          </ldapConnection>
    </div>
    
    <div>
          <ldapConnection>
    </div>
    
    <div>
            <name>src-ad</name>
    </div>
    
    <div>
            <url>ldap://172.18.160.38:389/DC=newdomain,DC=tld</url>
    </div>
    
    <div>
            <username>admin-user@newdomain.tld</username>
    </div>
    
    <div>
            <password>xxx</password>
    </div>
    
    <div>
            <authentication>SIMPLE</authentication>
    </div>
    
    <div>
            <pageSize>1000</pageSize>
    </div>
    
    <div>
          </ldapConnection>
    </div>
    
    <div>
        </connections>
    </div>
    
    <div>
        <audits/>
    </div>
    
    <div>
        <tasks>
    </div>
    
    <div>
          <task>
    </div>
    
    <div>
            <name>MySyncTask</name>
    </div>
    
    <div>
            <bean>org.lsc.beans.SimpleBean</bean>
    </div>
    
    <div>
            <ldapSourceService>
    </div>
    
    <div>
              <name>MySyncTask-src</name>
    </div>
    
    <div>
              <connection reference=&#8221;src-ad&#8221;/>
    </div>
    
    <div>
              <baseDn>cn=Users,DC=newdomain,DC=tld</baseDn>
    </div>
    
    <div>
              <pivotAttributes>
    </div>
    
    <div>
                <string>mail</string>
    </div>
    
    <div>
              </pivotAttributes>
    </div>
    
    <div>
              <fetchedAttributes>
    </div>
    
    <div>
                <string>cn</string>
    </div>
    
    <div>
                <string>sn</string>
    </div>
    
    <div>
                <string>givenName</string>
    </div>
    
    <div>
                <string>mail</string>
    </div>
    
    <div>
                <string>sAMAccountName</string>
    </div>
    
    <div>
                <string>userPrincipalName</string>
    </div>
    
    <div>
              </fetchedAttributes>
    </div>
    
    <div>
              <getAllFilter>(&(mail=*)(objectClass=user))</getAllFilter>
    </div>
    
    <div>
              <getOneFilter>(&(mail={mail})(objectClass=user))</getOneFilter>
    </div>
    
    <div>
              <cleanFilter>(&(mail={mail})(objectClass=user))</cleanFilter>
    </div>
    
    <div>
              <interval>6</interval>
    </div>
    
    <div>
            </ldapSourceService>
    </div>
    
    <div>
            <ldapDestinationService>
    </div>
    
    <div>
              <name>MySyncTask-dst</name>
    </div>
    
    <div>
              <connection reference=&#8221;dst-ldap&#8221;/>
    </div>
    
    <div>
              <baseDn>ou=Users,DC=domain,DC=tld</baseDn>
    </div>
    
    <div>
              <pivotAttributes>
    </div>
    
    <div>
                <string>mail</string>
    </div>
    
    <div>
              </pivotAttributes>
    </div>
    
    <div>
              <fetchedAttributes>
    </div>
    
    <div>
                <string>cn</string>
    </div>
    
    <div>
                <string>sn</string>
    </div>
    
    <div>
                <string>objectClass</string>
    </div>
    
    <div>
                <string>userPassword</string>
    </div>
    
    <div>
                <string>givenName</string>
    </div>
    
    <div>
                <string>mail</string>
    </div>
    
    <div>
                <string>uid</string>
    </div>
    
    <div>
              </fetchedAttributes>
    </div>
    
    <div>
              <getAllFilter>(&(uid=*)(objectClass=inetOrgPerson))</getAllFilter>
    </div>
    
    <div>
              <getOneFilter>(&(objectClass=inetOrgPerson)(mail={mail}))</getOneFilter>
    </div>
    
    <div>
            </ldapDestinationService>
    </div>
    
    <div>
            <propertiesBasedSyncOptions>
    </div>
    
    <div>
              <mainIdentifier>&#8221;cn=&#8221; + srcBean.getDatasetFirstValueById(&#8220;cn&#8221;) + &#8220;,ou=Users,dc=domain,dc=tld&#8221;</mainIdentifier>
    </div>
    
    <div>
              <defaultDelimiter>;</defaultDelimiter>
    </div>
    
    <div>
              <defaultPolicy>FORCE</defaultPolicy>
    </div>
    
    <div>
              <dataset>
    </div>
    
    <div>
                <name>objectClass</name>
    </div>
    
    <div>
                <policy>FORCE</policy>
    </div>
    
    <div>
                <forceValues>
    </div>
    
    <div>
                  <string>&#8221;inetOrgPerson&#8221;</string>
    </div>
    
    <div>
                  <string>&#8221;organizationalPerson&#8221;</string>
    </div>
    
    <div>
                  <string>&#8221;person&#8221;</string>
    </div>
    
    <div>
                  <string>&#8221;top&#8221;</string>
    </div>
    
    <div>
                </forceValues>
    </div>
    
    <div>
                <delimiter>,</delimiter>
    </div>
    
    <div>
              </dataset>
    </div>
    
    <div>
              <dataset>
    </div>
    
    <div>
                <name>userPassword</name>
    </div>
    
    <div>
                <policy>KEEP</policy>
    </div>
    
    <div>
                <createValues>
    </div>
    
    <div>
                  <string>&#8221;{SASL}&#8221; + srcBean.getDatasetFirstValueById(&#8220;mail&#8221;)</string>
    </div>
    
    <div>
                </createValues>
    </div>
    
    <div>
              </dataset>
    </div>
    
    <div>
              <dataset>
    </div>
    
    <div>
                <name>sn</name>
    </div>
    
    <div>
                <policy>FORCE</policy>
    </div>
    
    <div>
                <forceValues>
    </div>
    
    <div>
                  <string>
    </div>
    
    <div>
        srcBean.getDatasetFirstValueById(&#8220;sAMAccountName&#8221;)</string>
    </div>
    
    <div>
                </forceValues>
    </div>
    
    <div>
              </dataset>
    </div>
    
    <div>
              <dataset>
    </div>
    
    <div>
                <name>uid</name>
    </div>
    
    <div>
                <policy>FORCE</policy>
    </div>
    
    <div>
                <forceValues>
    </div>
    
    <div>
                  <string>
    </div>
    
    <div>
        srcBean.getDatasetFirstValueById(&#8220;sAMAccountName&#8221;)</string>
    </div>
    
    <div>
                </forceValues>
    </div>
    
    <div>
              </dataset>
    </div>
    
    <div>
              <dataset>
    </div>
    
    <div>
                <name>default</name>
    </div>
    
    <div>
                <policy>FORCE</policy>
    </div>
    
    <div>
              </dataset>
    </div>
    
    <div>
            </propertiesBasedSyncOptions>
    </div>
    
    <div>
          </task>
    </div>
    
    <div>
        </tasks>
    </div>
    
    <div>
      </lsc>
    </div>
  </div>
  
  <div>
  </div>
  
  <div>
    To synchronize use (add &#8220;-n&#8221; for dry-tun):
  </div>
  
  <div>
    /usr/bin/lsc -f /etc/lsc/ad-to-ldap/ -s all -c all
  </div>
  
  <h4 style="text-align: left;">
  </h4>
  
  <h4 style="text-align: left;">
    saslauthd installation
  </h4>
  
  <div>
    Configure password proxying with SASL. Installing saslauthd on the same node with OpenLDAP (slapd).
  </div>
  
  <div>
  </div>
  
  <div>
    <div class="line number1 index0 alt2" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      apt-get install libsasl2-modules-ldap sasl2-bin
    </div>
    
    <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
      sed &#8216;s/MECHANISMS=.*/MECHANISMS=&#8221;ldap&#8221;/&#8217; /etc/default/saslauthd
    </div>
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    /etc/saslauthd.conf:
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    <div class="line number1 index0 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_servers: ldap://172.18.160.38
    </div>
    
    <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_search_base: cn=users,dc=newdomain,dc=tld
    </div>
    
    <div class="line number3 index2 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_timeout: 10
    </div>
    
    <div class="line number4 index3 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_filter: sAMAccountName=%U
    </div>
    
    <div class="line number5 index4 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_bind_dn: cn=romans,cn=users,dc=newdomain,dc=tld
    </div>
    
    <div class="line number6 index5 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_password: xxx
    </div>
    
    <div class="line number7 index6 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_deref: never
    </div>
    
    <div class="line number8 index7 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_restart: yes
    </div>
    
    <div class="line number9 index8 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_scope: sub
    </div>
    
    <div class="line number10 index9 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_use_sasl: no
    </div>
    
    <div class="line number11 index10 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_start_tls: no
    </div>
    
    <div class="line number12 index11 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_version: 3
    </div>
    
    <div class="line number13 index12 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      ldap_auth_method: bind
    </div>
    
    <div class="line number13 index12 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
    </div>
    
    <div class="line number13 index12 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      /usr/lib/sasl2/slapd.conf:
    </div>
    
    <div class="line number13 index12 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      <div class="line number1 index0 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        pwcheck_method: saslauthd
      </div>
      
      <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        saslauthd_path: /var/run/saslauthd/mux
      </div>
      
      <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
      </div>
      
      <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        /etc/ldap/slapd.conf:
      </div>
      
      <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        <div class="line number1 index0 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
          sasl-host       localhost
        </div>
        
        <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
          sasl-secprops   none
        </div>
        
        <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        </div>
        
        <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
          Execute:
        </div>
        
        <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
        </div>
        
        <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
          <div class="line number1 index0 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
            usermod -a -G sasl openldap
          </div>
          
          <div class="line number2 index1 alt1" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
            service saslauthd restart
          </div>
          
          <div class="line number3 index2 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
            service slapd restart
          </div>
          
          <div class="line number3 index2 alt2" style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; width: auto !important;">
          </div>
          
          <h4 style="background-attachment: initial !important; background-clip: initial !important; background-image: none !important; background-origin: initial !important; background-position: initial !important; background-repeat: initial !important; background-size: initial !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; height: auto !important; left: auto !important; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; text-align: left; top: auto !important; vertical-align: baseline !important; width: auto !important;">
            Checking installation
          </h4>
          
          <div>
          </div>
          
          <div>
            check that saslauthd working properly:
          </div>
          
          <div>
            testsaslauthd -u test1 -p xxx
          </div>
          
          <div>
          </div>
          
          <div>
            check that OpenLDAP able to proxy requests to AD:
          </div>
          
          <div>
            ldapsearch -x -LLL
          </div>
          
          <div>
                       -H ldap://127.0.0.1/
          </div>
          
          <div>
                       -b ou=users,dc=domain,dc=tld
          </div>
          
          <div>
                       -D &#8216;mail=test1@newdomain.tld,ou=Users,dc=domain,dc=tld&#8217;
          </div>
          
          <div>
                       -w &#8216;xxx&#8217;
          </div>
          
          <div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    Useful links:
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    1) Official LSC tutorial <a href="http://lsc-project.org/wiki/documentation/tutorial/openldaptoactivedirectory">OpenLDAP to AD</a>
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    2) Good blogpost <a href="https://chrisgilbert1.wordpress.com/2014/04/04/active-directory-to-openldap-sync-with-lsc/">AD to OpenLDAP</a>
  </div>
  
  <div class="line number2 index1 alt1" style="background: none #ffffff !important; border-radius: 0px !important; border: 0px !important; bottom: auto !important; box-sizing: content-box !important; color: #333333; float: none !important; font-family: Consolas, 'Bitstream Vera Sans Mono', 'Courier New', Courier, monospace; font-size: 14px; height: auto !important; left: auto !important; line-height: 20px; margin: 0px !important; min-height: inherit !important; outline: 0px !important; overflow: visible !important; padding: 0px 1em 0px 0px !important; position: static !important; right: auto !important; top: auto !important; vertical-align: baseline !important; white-space: nowrap !important; width: auto !important;">
    3) Official <a href="http://lsc-project.org/wiki/documentation/start">LSC documentation</a>
  </div>
</div>