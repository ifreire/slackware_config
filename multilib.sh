#!/bin/bash
#
#  This script will Slackware multilib from Alien BOB repo.
#  Change SLACKVER for that is installed on your pc.
#
#  Run as root.
#
#  AUTHOR  : Iuri Freire
#  EMAIL   : iuricostafreire at gmail dot com
#  GITHUB  : github.com/ifreire
#  DATE    : 2020-05-22
#  BASED ON: https://crish4cks.net/my-slackware-configuration/
#

SLACKVER=current

mkdir ~/.multilibpkgs
cd ~/.multilibpkgs

lftp -c "open http://bear.alienbase.nl/mirrors/people/alien/multilib/ ; mirror -c -e -v ${SLACKVER}"

cd ${SLACKVER}
upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
