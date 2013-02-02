#!/bin/bash
SSID=$($(which iwgetid) wlp11s0 -r)

case "$SSID" in
    "pala")
        nc nalanda 22
        ;;
    *)
        nc nalanda.bd.to 22
        ;;
esac
