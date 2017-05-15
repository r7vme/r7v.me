---
title: ssh-agent via systemd
author: rsokolkov
type: post
date: 2014-12-01T18:31:00+00:00
url: /ssh-agent-via-systemd/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 2471655836841133303
blogger_author:
  - 14718283222819047051
blogger_permalink:
  - /2014/12/ssh-agent-via-systemd.html
categories:
  - Uncategorized
tags:
  - arch
  - ssh-agent
  - systemd

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  Main issue if you&#8217;re not using desktop environment, how and when to start &#8220;ssh-agent&#8221; to store your ssh identity info. In case of full DE you have special daemon, like &#8220;gnome-keyring&#8221;.</p> 
  
  <p>
    On the other hand there are a lot of custom hacks like &#8220;how to use ssh-agent with screen&#8221; or &#8220;using with xinitrc&#8221;, etc.
  </p>
  
  <p>
    Finally i&#8217;ve found that using ssh-agent with systemd is pretty useful. Example from&nbsp;<a href="https://wiki.archlinux.org/index.php/SSH_keys#Start_ssh-agent_with_systemd_user">arch wiki</a>&nbsp;is not working for me (i assume for others also). I&#8217;m not using separate systemd socket and use additional SuccessExitStatus=2 parameter.
  </p>
  
  <h4 style="text-align: left;">
    1) Create &#8220;~/.config/systemd/user/ssh-agent.service&#8221;
  </h4>
  
  <p>
    mkdir -p ~/.config/systemd/user<br /> cat << EOF > ~/.config/systemd/user/ssh-agent.service<br /> [Unit]<br /> Description=ssh-agent
  </p>
  
  <p>
    [Service]<br /> ExecStart=/usr/bin/ssh-agent -d -a %t/ssh_auth_sock<br /> SuccessExitStatus=2
  </p>
  
  <p>
    [Install]<br /> WantedBy=default.target<br /> EOF
  </p>
  
  <h4 style="text-align: left;">
    2) Start and enable ssh-agent service
  </h4>
  
  <p>
    systemctl &#8211;user daemon-reload<br /> systemctl &#8211;user enable ssh-agent<br /> systemctl &#8211;user start ssh-agent
  </p>
  
  <p>
  </p>
  
  <h4 style="text-align: left;">
    3) Check that it works properly
  </h4>
  
  <p>
    ssh-add -l
  </p>
  
  <div>
  </div>
</div>