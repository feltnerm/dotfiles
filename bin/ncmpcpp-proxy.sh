#!/bin/bash
SSID=$($(which iwgetid) wlp11s0 -r)

case "$SSID" in
    "pala")
        ncmpcpp -h nalanda
        ;;
    *)
        ncmpcpp
        ;;
esac
