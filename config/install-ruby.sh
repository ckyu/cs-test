#!/usr/bin/env bash

echo "Installing rbenv and ruby-build"
export HOME=/home/vagrant
RBENV_DIR=$HOME/.rbenv
# rbenv
git clone http://github.com/sstephenson/rbenv.git $RBENV_DIR
export PATH="$RBENV_DIR/bin:$PATH"
eval "$(rbenv init -)"

# ruby-build
git clone http://github.com/sstephenson/ruby-build.git $RBENV_DIR/plugins/ruby-build
export PATH="$RBENV_DIR/plugins/ruby-build/bin:$PATH"
source $HOME/.bashrc

# Add to bashrc so that the path is retained
echo 'export PATH="/home/vagrant/.rbenv/bin/:/home/vagrant/.rbenv/plugins/ruby-build/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

echo "Installing Ruby 2.2.0"
rbenv install 2.2.0
rbenv global 2.2.0
rbenv rehash

echo "Installing Bundler, Rails and Rake"
gem install bundler

cd /vagrant
bundle install

# Cron jobs
# Delete expired tokens at midnight.
cron = "0 0 * * * cd /vagrant && /home/vagrant/.rbenv/shims/rake token:clear"
echo "$cron" >> mycron
crontab mycron
rm mycron