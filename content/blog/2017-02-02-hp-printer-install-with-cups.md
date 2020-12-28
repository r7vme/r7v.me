---
draft: true
title: hp printer install with cups
author: rsokolkov
type: post
date: 2017-02-02T20:31:45+00:00
url: /hp-printer-install-with-cups/
categories:
  - Uncategorized
tags:
  - arch
  - cups
  - hp
  - sane

---
    # Install cups and add printer
    sudo pacman -S hplip cups
    sudo systemctl start org.cups.cupsd
    sudo lpadmin -p printer1 -v socket://192.168.1.11:9100/ -E -P /usr/share/ppd/HP/hp-envy_4520_series.ppd.gz
    sudo lpoptions -p printer1 -o PageSize=A4
    sudo lpoptions -d printer1 
    
    #  Check that queue is visible
    lpstat -v
    
    # Print test page
    echo "Hello world!" | lp 
    
    # Delete printer
    sudo lpadmin -x printer1
    
    # Configure scanning
    sudo pacman -S sane simple-scan
    
    # Start scanning GUI
    simple-scan
