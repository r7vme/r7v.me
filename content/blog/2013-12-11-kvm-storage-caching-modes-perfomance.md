---
title: KVM storage caching modes perfomance comparison
author: rsokolkov
type: post
date: 2013-12-11T16:41:00+00:00
url: /kvm-storage-caching-modes-perfomance/
blogger_bid:
  - 6610086545674237724
blogger_blog:
  - romans-it.blogspot.com
blogger_id:
  - 3052292934304185693
blogger_author:
  - 14718283222819047051
blogger_comments:
  - 2
blogger_permalink:
  - /2013/12/kvm-storage-caching-modes-perfomance.html
categories:
  - Uncategorized

---
<div dir="ltr" style="text-align: left;" trbidi="on">
  In my everyday work i need perfomance rich KVM VMs on my workstation. I already use virtio drivers for network and storage. But what about tune it more?</p> 
  
  <p>
    First, I&#8217;ve moved my VMs from qcow images to raw LVM volumes.
  </p>
  
  <p>
    Next, I&#8217;ve switced disk cache mode to &#8216;unsafe&#8217; as most fastest. I don&#8217;t care about data integrity if smth goes wrong.
  </p>
  
  <p>
    But decided to compare different modes. Detailed description about cache modes could be found <a href="http://pic.dhe.ibm.com/infocenter/lnxinfo/v3r0m0/topic/liaat/liaatbpkvmguestcache.htm" target="_blank">here</a>.
  </p>
  
  <p>
    Cache modes differ mostly by used or not &#8220;page cache&#8221; of host operating sytem and used or not &#8220;write cache&#8221; of host hardware disk (See table 1).
  </p>
  
  <p>
    Table 1
  </p>
  
  <div dir="ltr">
    <table style="border-collapse: collapse; border: none;">
      <tr style="height: 0px;">
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
        </td>
        
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            Disk Write Cache (Host)
          </div>
        </td>
        
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            Page Cache (Host)
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            writethrough
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            ×
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            ✔
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            none
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            ✔
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            ×
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            writeback
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            ✔
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            ✔
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            unsafe
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            Used, but ignores transfer operations
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            Used, but ignores transfer operations
          </div>
        </td>
      </tr>
    </table>
  </div>
  
  <p>
    I&#8217;ve done disk perfomance testing with different cache modes on raw LVM volume. Used bonnie++ benchmark. 5 tests for every cache mode. Full results <a href="https://drive.google.com/file/d/0B7P1gq76BuUiM3MtdVVGMTR4SXM/edit?usp=sharing" target="_blank">here</a>.
  </p>
  
  <p>
    Table 2
  </p>
  
  <div dir="ltr">
    <table style="border-collapse: collapse; border: none;">
      <tr style="height: 0px;">
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
        </td>
        
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            Write (sequental block), MBs
          </div>
        </td>
        
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            Read (sequental block), MBs
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            writethrough
          </div>
        </td>
        
        <td style="background-color: red; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            35
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            2337 (page cache)
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            none
          </div>
        </td>
        
        <td style="background-color: yellow; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            49
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            103
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            writeback
          </div>
        </td>
        
        <td style="background-color: yellow; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            45
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            2381 (page cache)
          </div>
        </td>
      </tr>
      
      <tr style="height: 0px;">
        <td style="background-color: #b7b7b7; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            unsafe
          </div>
        </td>
        
        <td style="background-color: lime; border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            54
          </div>
        </td>
        
        <td style="border: 1px solid #000000; padding: 7px 7px 7px 7px; vertical-align: top;">
          <div dir="ltr" style="line-height: 1; margin-bottom: 0pt; margin-top: 0pt;">
            2257 (page cache)
          </div>
        </td>
      </tr>
    </table>
  </div>
  
  <p>
    Most fastest mode is &#8220;unsafe&#8221;. But do not use &#8220;unsafe&#8221; mode if you need data integrity.<br /> Optimal mode is &#8220;writeback&#8221;, it has good write perfomance and used page cache, that increases read perfomance a lot.<br /> Safest mode is writethrough(by default in libvirt), but slowest.
  </p>
  
  <p>
    Resume:<br /> <b>unsafe</b> cache mode gave me <b>+57%</b> disk perfomance.
  </p>
  
  <p>
    Specs:<br /> Disk: Seagate Barracuda 500G (ST500DM002-1BC142)<br />MB: ASUS P8H67-M EVO<br />CPU: Intel(R) Core(TM) i5-2500K CPU @ 3.30GHz<br />OS: ARCH linux 3.11.6-1-ARCH x86_64 (libvirt 1.1.4-1, qemu 1.6.1-2)</div>