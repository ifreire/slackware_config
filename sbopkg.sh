#!/bin/bash

cd ~/Downloads/pkgs
mkdir sbopkg
cd sbopkg

wget -c https://github.com/sbopkg/sbopkg/releases/download/0.38.1/sbopkg-0.38.1-noarch-1_wsr.tgz

upgradepkg --reinstall --install-new sbopkg-0.38.1-noarch-1_wsr.tgz

exit 0
