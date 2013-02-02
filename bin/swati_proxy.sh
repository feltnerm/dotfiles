#!/bin/bash
SSID=$($(which iwgetid) wlp11s0 -r)

case "$SSID" in
    "pala")
        nc saraswati 22
        ;;
    *)
        nc swati.dyndns.tv 22
        ;;
esac
