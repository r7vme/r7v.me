---
draft: true
title: Stream two audio tracks into different outputs (i.e. headphones and speakers)
author: rsokolkov
type: post
date: 2016-02-12T10:09:55+00:00
url: /stream-two-audio-tracks-into-different-outputs-i-e-headphones-and-speakers/
categories:
  - Uncategorized
tags:
  - linux
  - pulseaudio
  - vlc

---
Let&#8217;s say you have video file (movie, TV series, whatever) with two audio tracks (Language 1, Language 2). Idea is to watch same video with on two languages simultaneously. Of course, you need two audio outputs. It can be speakers and headphones. Ok, let me share my method. BTW, i was encouraged to do this by a message in VLC dev mailing list [1][1].

![enter image description here][2]

<!--more-->

Prerequisites: &#8211; Linux (Arch linux in my case) with pulseaudio &#8211; VLC media player &#8211; Two sound devices (built-in speakers and USB headphones) &#8211; Understanding basics of PulseAudio (such as sink, source)

Number #1: Start VLC in following mode

    vlc -q --sout-all --sout '#display' <VIDEO_FILE>
    

Number #2: Redirect Audio input to vacant Audio output (Sink)

    pacmd move-sink-input $AUDIO $SINK
    

To get SINK use

    pacmd list-sinks
    

To get AUDIO use:

    pacmd list-sink-inputs
    

Here is the dumb script that will check if you have two inputs and two outputs and will move input to vacant output.

    #!/bin/bash
    
    fail () {
      echo "ERROR: $1"
      killall vlc
      exit 1
    }
    
    check () {
      NUM_OF_AUDIO=$(pacmd list-sink-inputs|grep index|wc -l)
      NUM_OF_SINKS=$(pacmd list-sinks|grep index|wc -l)
    
      [[ $NUM_OF_AUDIO != '2' ]] && fail "Only 2 audio inputs supported. Current is $NUM_OF_AUDIO"
      [[ $NUM_OF_SINKS != '2' ]] && fail "Only 2 audio outputs supported. Current is $NUM_OF_SINKS"
    }
    
    SINK1="alsa_output.pci-0000_00_1b.0.analog-stereo"
    SINK2=$(pacmd list-sinks|grep -v $SINK1|grep -m1 name:|cut -f2 -d'<'|tr -d '>')
    
    vlc -q --sout-all --sout '#display' $1 &
    
    sleep 1
    check
    
    AUDIO1=$(pacmd list-sink-inputs |awk '/index/{i++}i==1{print; exit}'|cut -d':' -f2|tr -d ' ')
    AUDIO2=$(pacmd list-sink-inputs |awk '/index/{i++}i==2{print; exit}'|cut -d':' -f2|tr -d ' ')
    
    echo $SINK1 $SINK2
    echo $AUDIO1 $AUDIO2
    
    set -x
    if [[ $(pacmd list-sink-inputs|grep $SINK1|wc -l) == '2' ]]
    then
      pacmd move-sink-input $AUDIO2 $SINK2
    else
      pacmd move-sink-input $AUDIO2 $SINK1
    fi
    set +x
    

Disadvantages: &#8211; Dis-synchronizing video and audio after some time &#8211; Pausing breaks sound

References: 1 &#8211; <https://mailman.videolan.org/pipermail/vlc-commits/2011-April/006155.html>

 [1]: https://mailman.videolan.org/pipermail/vlc-commits/2011-April/006155.html
 [2]: /uploads/2016/02/Untitled-drawing-1.jpg
