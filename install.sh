#!/bin/bash

set -e

# Update atp and dpkg
apt-get update
apt-get install apt dpkg -y
apt-get update
apt-get install -y openssh-client curl build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config git

# Install acquia ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable
/bin/bash -l -c "rvm requirements"
/bin/bash -l -c "rvm install 2.1.6"
/bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
/bin/bash -l -c "rvm install 2.1.7"
/bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
/bin/bash -l -c "rvm install 2.2"
/bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
/bin/bash -l -c "rvm use 2.1.7 --default"

# Install phpenv
git clone https://github.com/CHH/phpenv.git /tmp/phpenv
PHPENV_ROOT=/usr/local/phpenv /tmp/phpenv/bin/phpenv-install.sh
echo 'export PATH="/usr/local/phpenv/bin:$PATH"' >> /etc/profile.d/phpenv.sh
echo 'eval "$(phpenv init -)"' >> /etc/profile.d/phpenv.sh
git clone https://github.com/php-build/php-build.git /usr/local/phpenv/plugins/php-build

# Install php versions
apt-get install -y libjpeg-dev libpng-dev libcurl4-openssl-dev re2c libmcrypt-dev libtidy-dev libgmp-dev libc-client-dev freetds-dev libpq-dev libt1-dev libxpm-dev libltdl-dev libmagickwand-dev libgpgme11-dev libssh2-1-dev
/bin/bash -l -c "phpenv install 5.5.29"
/bin/bash -l -c "phpenv install 5.6.13"
/bin/bash -l -c "phpenv install 7.0.0RC2"
/bin/bash -l -c "phpenv global 5.6.13"
/bin/bash -l -c "curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin"

apt-get clean
apt-get purge
