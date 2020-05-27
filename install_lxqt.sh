#!/bin/bash
#
#  This script will install LXQt from alienbob repo.
#  Change SLACKVER for that is installed on your pc.
#
#  Run as root.
#
#  AUTHOR: Iuri Freire
#  EMAIL : iuricostafreire at gmail dot com
#  GITHUB: github.com/ifreire
#  DATE  : 2020-05-22
#

SLACKVER=current
ARCH=$(uname -m)

mkdir ~/.lxqtpkgs
cd ~/.lxqtpkgs

lftp -c "open http://slackware.uk/people/alien/sbrepos/${SLACKVER}/${ARCH}/lxqt/ ; mirror -c -e -v"
wget -c https://alien.slackbook.org/ktown/${SLACKVER}/latest/${ARCH}/kde/frameworks/kwindowsystem-5.70.0-${ARCH}-1alien.txz

upgradepkg --reinstall --install-new *.t?z


