#!/usr/bin/python

import dbus
import os
import sys


try:
    bus = dbus.SessionBus()
    spotify = bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")


    if os.environ.get('BLOCK_BUTTON'):
        control_iface = dbus.Interface(spotify, 'org.mpris.MediaPlayer2.Player')
        if (os.environ['BLOCK_BUTTON'] == '1'):
            control_iface.Previous()
        elif (os.environ['BLOCK_BUTTON'] == '2'):
            control_iface.PlayPause()
        elif (os.environ['BLOCK_BUTTON'] == '3'):
            control_iface.Next()

    spotify_iface = dbus.Interface(spotify, 'org.freedesktop.DBus.Properties')
    props = spotify_iface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    
    artist = str(props['xesam:artist'][0])
    title = str(props['xesam:title'])
    if (sys.version_info > (3, 0)):
        print(artist[:50] + " - " + title[:50])
    else:
        print(artist[:50] + " - " + title[:50]).encode('utf-8')
    exit
except dbus.exceptions.DBusException:
    exit



