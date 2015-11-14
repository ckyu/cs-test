#!/usr/bin/env bash

echo "Updating repository"
# add-apt-repository -y ppa:chris-lea/node.js
apt-get -y update > /dev/null

echo "Installing nginx"
apt-get install -y nginx > /dev/null

echo "Installing sqlite"
apt-get install -y sqlite3 libsqlite3-dev > /dev/null

echo "Installing git"
apt-get install -y git > /dev/null

echo "Installing nodejs"
apt-get -y install nodejs > /dev/null

echo "Installing other dependencies"
apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev libxml2-dev libxslt-dev > /dev/null
