#!/bin/bash
#
# This script will automate the post installation of
# Slackware Linux.
#
# After Slackware installation, add your user, make
# the login, then run this script.
#
# author: Iuri Costa Freire
# email : iuricostafreire@gmail.com
#

# DIRECTORY OF SETUP.SH

DIR=$(pwd)

sh create_dir.sh

sh multilib.sh

sh slackpkgplus.sh

sh sbopkg.sh

sh firefox.sh
