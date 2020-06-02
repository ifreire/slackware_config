#!/bin/bash

cd ~/Downloads/pkgs/slackpkgplus
wget -c https://iweb.dl.sourceforge.net/project/slackpkgplus/slackpkg%2B-1.7.0-noarch-10mt.txz
upgradepkg --install-new slackpkg%2B-1.7.0-noarch-10mt.txz
