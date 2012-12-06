#!/bin/bash
SSID=$($(which iwgetid) wlan0 -r)

case "$SSID" in
    "pala")
        nc saraswati 22
        ;;
    *)
        nc swati.dyndns.tv 22
        ;;
esac
