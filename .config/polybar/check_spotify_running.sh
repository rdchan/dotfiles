#!/bin/bash
if [[ $(ps aux | grep spotify | tail -n +2) ]]; then
    echo "yes"
    exit 1
else
    echo "no"
    exit 0
fi
