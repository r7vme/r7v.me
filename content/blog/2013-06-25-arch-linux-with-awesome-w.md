---
draft: true
title: Arch Linux with Awesome wm
author: rsokolkov
type: post
date: 2013-06-25T22:10:00+00:00
url: /arch-linux-with-awesome-w/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 309505725803219714
blogger_author:
  - 14718283222819047051
blogger_comments:
  - 1
blogger_permalink:
  - /2013/06/arch-linux-with-awesome-wm.html
categories:
  - Uncategorized
tags:
  - arch
  - awesome
  - linux

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  <div dir="ltr" style="text-align: left;" trbidi="on">
    <div style="text-align: left;">
      Weeks ago i&#8217;ve switched from Ubuntu to Arch Linux. Why? I don&#8217;t want to depend from some commercialized way of Ubuntu, also close to me Arch principles &#8220;&#8230; elegance, code correctness, minimalism, and simplicity &#8230;&#8221; (see&nbsp;<a href="https://en.wikipedia.org/wiki/Arch_Linux">https://en.wikipedia.org/wiki/Arch_Linux</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/KISS_principle">https://en.wikipedia.org/wiki/KISS_principle</a>). Why not gentoo? ha,ha, it is to hardcore for me.&nbsp;Arch has a very useful&nbsp;<a href="https://wiki.archlinux.org/" target="_blank">wiki</a>. You could start from this&nbsp;<a href="https://wiki.archlinux.org/index.php/Beginners%27_Guide" target="_blank">guide</a>.
    </div>
    
    <p>
      Let&#8217;s try to install Arch with Awesome window manager.
    </p>
    
    <p>
      <b>WARN: Please try it on Virtual machine first.</b>
    </p>
    
    <h2 style="text-align: left;">
      Installing base system
    </h2>
    
    <h4 style="text-align: left;">
      1. Create bootable USB (<a href="https://wiki.archlinux.org/index.php/USB_Installation_Media">https://wiki.archlinux.org/index.php/USB_Installation_Media</a>)
    </h4>
    
    <p>
      <b><br /></b><br />
    </p>
    
    <div style="text-align: left;">
      <b>wget&nbsp;http://mirror.yandex.ru/archlinux/iso/2013.06.01/archlinux-2013.06.01-dual.iso</b>
    </div>
    
    <div style="text-align: left;">
      <b>dd bs=4M if=archlinux-2013.06.01-dual.iso of=/dev/sdx</b>
    </div>
    
    <div style="text-align: left;">
    </div>
    
    <p>
      Where &#8220;/dev/sdx&#8221; NOT mounted USB stick.
    </p>
    
    <h4 style="text-align: left;">
      2. Boot from this stick. It&nbsp;prompts&nbsp;you into root console.
    </h4>
    
    <h4 style="text-align: left;">
      3. Partitioning with LVM.
    </h4>
    
    <p>
      Use &#8220;lsblk&#8221; to find target block device (i.e. /dev/sda). I prefer fdisk for partitioning. Command below will create two partitions (200M and all remain space).
    </p>
    
    <p>
      <b>echo -e &#8220;onnnnnn+200Mnnnnnnnwn&#8221;|fdisk /dev/sda</b><br /> <b><br /></b><br /> <b>mkfs.ext2 /dev/sda1</b><br /> <b>pvcreate /dev/sda2</b><br /> <b>vgcreate vgroot /dev/sda2</b><br /> <b>lvcreate -n root -L 10G vgroot</b><br /> <b>lvcreate -n swap -L 1G vgroot</b><br /> <b>lvcreate -n home -L 5G vgroot</b><br /> <b>mkfs.ext4 /dev/vgroot/root</b><br /> <b>mkfs.ext4 /dev/vgroot/home</b><br /> <b>mkswap /dev/vgroot/swap</b><br /> <b>mount /dev/vgroot/root /mnt</b><br /> <b>mkdir /mnt/{boot,home}</b><br /> <b>mount /dev/vgroot/home /mnt/home</b><br /> <b>mount /dev/sda1 /mnt/boot</b><br /> <b>swapon /dev/vgroot/swap</b>
    </p>
    
    <h4 style="text-align: left;">
      4. Connect to the Internet.&nbsp;
    </h4>
    
    <p>
      By default DHCP service is enabled, but if you need some other network settings (i.e. static or wireless) read <a href="https://wiki.archlinux.org/index.php/Configuring_network" target="_blank">this</a>. To check Internet:
    </p>
    
    <p>
      <b>ping -c 3 www.google.com</b>
    </p>
    
    <p>
    </p>
    
    <h4 style="text-align: left;">
      5. Install base system.
    </h4>
    
    <p>
      Enable preferred mirror in /etc/pacman.d/mirrorlist and
    </p>
    
    <p>
      <b>pacstrap /mnt base base-devel</b>
    </p>
    
    <p>
    </p>
    
    <h4 style="text-align: left;">
      6. Configure system.
    </h4>
    
    <p>
      <b>genfstab -p /mnt >> /mnt/etc/fstab</b><br /> <b>arch-chroot /mnt</b><br /> <b>echo &#8220;myhostname&#8221; > /etc/hostname</b><br /> <b>ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime</b><br /> <b>sed -i -e &#8216;s/#ru_RU.UTF-8/ru_RU.UTF-8/&#8217; -e &#8216;s/#en_US.UTF-8/en_US.UTF-8/&#8217; /etc/locale.gen</b><br /> <b>locale-gen</b><br /> <b>echo &#8216;LANG=&#8221;en_US.UTF-8&#8243;&#8216; > /etc/locale.conf</b>
    </p>
    
    <p>
      Edit&nbsp;/etc/mkinitcpio.conf.&nbsp;Add &#8220;lvm2&#8221; hook between &#8220;block&#8221; and &#8220;filesystems&#8221;.
    </p>
    
    <p>
      &#8230;<br /> <i>HOOKS=&#8221;base udev autodetect modconf block lvm2 filesystems keyboard fsck&#8221;</i><br /> &#8230;
    </p>
    
    <p>
      <b>mkinitcpio -p linux</b>
    </p>
    
    <p>
      Set root password with &#8220;passwd&#8221; and create regular user:
    </p>
    
    <p>
      <b>useradd -m -s /bin/bash user1</b><br /> <b>passwd user1</b>
    </p>
    
    <p>
      Enable DHCP service:
    </p>
    
    <p>
      <b>systemctl enable dhcpcd.service</b>
    </p>
    
    <p>
    </p>
    
    <h4 style="text-align: left;">
      7. Installing GRUB.
    </h4>
    
    <p>
      See also&nbsp;<a href="https://wiki.archlinux.org/index.php/GRUB">https://wiki.archlinux.org/index.php/GRUB</a>
    </p>
    
    <p>
      <b>grub-install &#8211;recheck /dev/sda</b><br /> <b>grub-mkconfig -o /boot/grub/grub.cfg</b>
    </p>
    
    <p>
    </p>
    
    <h4 style="text-align: left;">
      8. Umount and reboot
    </h4>
    
    <p>
      <b>exit</b><br /> <b>umount /mnt/{boot,home,}</b>
    </p>
    
    <h2 style="text-align: left;">
      Installing Awesome wm
    </h2>
    
    <div>
      This is cool tiling window manager. Official page&nbsp;<a href="http://awesome.naquadah.org/">http://awesome.naquadah.org/</a>.
    </div>
    
    <div>
    </div>
    
    <div>
      Execute commands below from root.
    </div>
    
    <div>
    </div>
    
    <h4 style="text-align: left;">
      1. Install video driver.
    </h4>
    
    <div>
      Detailed instruction&nbsp;<a href="https://wiki.archlinux.org/index.php/Beginners'_Guide#Install_a_video_driver" target="_blank">here</a>.
    </div>
    
    <div>
    </div>
    
    <div>
      <b>pacman -S xf86-video-vesa</b>
    </div>
    
    <div>
    </div>
    
    <div>
      For nvidia &#8220;xf86-video-nv&#8221;, ATI &#8220;xf86-video-ati&#8221;
    </div>
    
    <div>
    </div>
    
    <h4 style="text-align: left;">
      2. Install X server, awesome wm and <a href="http://slim.berlios.de/" target="_blank">slim</a> dm.
    </h4>
    
    <div>
      <div>
        <div>
          <b>pacman -S xorg-server xorg-server-utils xorg-xinit xterm awesome slim</b>
        </div>
      </div>
    </div>
    
    <div>
      <b>systemctl enable slim.service</b>
    </div>
    
    <div>
    </div>
    
    <h4 style="text-align: left;">
      3. Configure xinitrc.
    </h4>
    
    <div>
      <b>su &#8211; user1</b>
    </div>
    
    <div>
      <b>echo &#8220;exec awesome&#8221; > .xinitrc</b>
    </div>
    
    <div>
      <b>mkdir -p .config/awesome</b>
    </div>
    
    <div>
      <b>cp /etc/xdg/awesome/rc.lua .config/awesome/</b><br /> <b>reboot</b>
    </div>
    
    <div>
    </div>
    
    <h4 style="text-align: left;">
      4. Using awesome.
    </h4>
    
    <div>
      For advanced usage should read official <a href="http://awesome.naquadah.org/wiki/Main_Page" target="_blank">wiki</a>
    </div>
    
    <div>
    </div>
    
    <h4 style="text-align: left;">
      Keys:
    </h4>
    
    <div>
      win+{1, 2, 3,.., left, right} &#8211; switch between tags (like screens in gnome)
    </div>
    
    <div>
      win+r &#8211; execute command (i.e. &#8220;firefox&#8221;)
    </div>
    
    <div>
      win+enter &#8211; open terminal
    </div>
    
    <div>
      win+{j, k} &#8211; switch between windows
    </div>
    
    <div>
      win+tab &#8211; switch to prev. window
    </div>
    
    <div>
      win+w &#8211; open awesome menu
    </div>
    
    <div>
    </div>
    
    <h4 style="text-align: left;">
      rc.lua:
    </h4>
    
    <div>
      In internet a lot of info about customizing rc.lua. Here is only simple example. This will set capslock key to switch keyboard layout.
    </div>
    
    <div>
    </div>
    
    <div>
      <b>echo &#8216;awful.util.spawn_with_shell(&#8220;setxkbmap -layout &#8216;us,ru&#8217; -option &#8216;grp:caps_toggle,grp_led:scroll'&#8221;)&#8217; >> .config/awesome/rc.lua</b>
    </div>
    
    <div>
    </div>
    
    <div>
      Check syntax:
    </div>
    
    <div>
    </div>
    
    <div>
      <b>awesome -k .config/awesome/rc.lua</b>
    </div>
    
    <div>
    </div>
    
    <div>
      Then type &#8220;ctrl+win+r&#8221; to restart awesome.
    </div>
    
    <div>
    </div>
    
    <div>
      Now you are free to install necessary software with &#8220;pacman&#8221;, customize awesome with &#8220;rc.lua&#8221;, etc. ,etc. ,etc.
    </div>
  </div>
</div>
