#!/bin/bash
#
# Referred from manylinux project: https://github.com/pypa/manylinux/blob/master/docker/build_scripts/fixup-mirrors.sh
#
# Fix up mirrors once distro reaches EOL

# Stop at any error, show all commands
set -exuo pipefail

# Centos 6 is EOL and is no longer available from the usual mirrors, so switch
# to https://vault.centos.org
sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf
sed -i 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/*.repo
sed -i 's;^.*baseurl=http://mirror;baseurl=https://vault;g' /etc/yum.repos.d/*.repo
sed -i 's;^.*baseurl=http://download.fedoraproject.org/pub;baseurl=https://archives.fedoraproject.org/pub/archive;g' /etc/yum.repos.d/*.repo
