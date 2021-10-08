#!/bin/bash
python ~/Scripts/text_snip.py
xclip -selection clipboard < /tmp/snip.txt
