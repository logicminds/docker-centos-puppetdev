#!/usr/bin/env bash
# This bootstraps Puppet on CentOS 6.x
# It has been tested on CentOS 6.4 64bit

set -e
yum install -y kernel-devel gcc-c++ kernel-headers make gcc wget git ruby-devel rubygems-devel hostname rubygem-bundler.noarch tar gzip unzip > /dev/null
yum install -y augeas-libs dmidecode ruby-augeas ruby-shadow hwdata libselinux-ruby libselinux-utils net-tools pciutils pciutils-libs virt-what zlib-devel
yum -y group install 'Development tools'

useradd puppet
REPO_URL="http://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi



# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
repo_path=$(mktemp)
wget --output-document=${repo_path} ${REPO_URL} 2>/dev/null
rpm -i ${repo_path} >/dev/null

# for selinux ruby versions
echo "[rhel-7-server-optional-rpms]
name = Red Hat Enterprise Linux 7 Server - Optional (RPMs)
baseurl = http://mirror.centos.org/centos/7/os/x86_64/
enabled = 1
gpgcheck = 0" >/etc/yum.repos.d/centos7_optional.repo


# Install Puppet...
mkdir -p /module
chown -R puppet:puppet /module
echo "Puppet installed!"
