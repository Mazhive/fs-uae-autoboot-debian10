#!/bin/sh
# Complementary script specific pi.

echo this Script needs sudo right please enter your sudo password.
su -
echo creating user
useradd -m -p amiga amiga

echo "script is opgestart $(date +%x_%X)" > /home/amiga/done
echo "deb [trusted=yes] https://download.opensuse.org/repositories/home:/FrodeSolheim:/stable/Debian_10/ /" > /etc/apt/sources.list.d/FrodeSolheim-stable.list
