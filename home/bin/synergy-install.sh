#!/usr/bin/env bash

# Run manually, after logging in to download synergy from https://symless.com/synergy
PATH_TO_DEB=~/dev/config/synergy/synergy_1.11.1.stable~b58+55ec3105_ubuntu19_amd64.deb

# Ref http://blog.bismith.net/?p=1225
sudo apt-get install libavahi-compat-libdnssd1
sudo dpkg -i "${PATH_TO_DEB}"
sudo apt --fix-broken install
