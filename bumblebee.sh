#!/bin/bash

export COMPAT32=yes;

cd ~/Downloads/pkgs
git clone https://github.com/WhiteWolf1776/Bumblebee-SlackBuilds.git
cd Bumblebee-SlackBuilds/

install_latest_pkg() {
  PACKAGE=$1
  if [ -d "$PACKAGE/" ]; then
    cd $PACKAGE/
  else
    cd ../$PACKAGE/
  fi
  sh $PACKAGE.SlackBuild
  ls -t --color=never /tmp/$PACKAGE-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}
}

install_latest_pkg_compat() {
  PACKAGE=$1
  if [ -d "$PACKAGE/" ]; then
    cd $PACKAGE/
  else
    cd ../$PACKAGE/
  fi
  if [ "$COMPAT32" = yes ]; then
    COMPAT32=yes sh $PACKAGE.SlackBuild
  else
    sh $PACKAGE.SlackBuild
  fi
  ls -t --color=never /tmp/$PACKAGE-*_bbsb.txz | head -1 | xargs -i upgradepkg --reinstall --install-new {}
}

sh download.sh

groupadd bumblebee

getent passwd | grep "/home" | cut -d: -f1 | sed '/ftp/d' | xargs -i usermod -G bumblebee -a {}

cd nouveau-blacklist
wget -c https://mirrors.slackware.com/slackware/slackware64-current/extra/xf86-video-nouveau-blacklist/xf86-video-nouveau-blacklist-1.0-noarch-1.txz
upgradepkg --reinstall --install-new xf86-video-nouveau-blacklist-1.0-noarch-1.txz
cd ..

install_latest_pkg libbsd

install_latest_pkg bumblebee

install_latest_pkg bbswitch

install_latest_pkg_compat primus

install_latest_pkg_compat primus_vk

install_latest_pkg nvidia-kernel

install_latest_pkg_compat nvidia-bumblebee

chmod +x /etc/rc.d/rc.bumblebeed
/etc/rc.d/rc.bumblebeed start

if [ -z "$(grep bumblebeed /etc/rc.d/rc.local)" ]; then
echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed start
fi" >> /etc/rc.d/rc.local
fi

if [ -z "$(grep bumblebeed /etc/rc.d/rc.local_shutdown)" ]; then
echo "if [ -x /etc/rc.d/rc.bumblebeed ]; then
  /etc/rc.d/rc.bumblebeed stop
fi" >> /etc/rc.d/rc.local_shutdown
fi

chmod +x /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local_shutdown
