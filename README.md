# docker-rvm-phpenv
Docker container build which includes rvm and phpenv

## Usage
  docker pull timhilliard/docker-rvm-phpenv

## Ruby
RVM has been installed as well as bundler for each version of ruby.

### Versions
- 2.1.6
- 2.1.7
- 2.2.0

### Usage
  rvm use 2.1.6

## PHP
PHPENV has been install with php-build as an extension. Composer has also been
installed.

### Versions
- 5.5.29
- 5.6.13
- 7.0.0RC2

### Usage
  phpenv global 5.5.29
