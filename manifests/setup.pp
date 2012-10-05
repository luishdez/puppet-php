# Class: php
#
#
define php::setup (
    $phpSetup = {}
  ) {
  $phpPackages = [ 
    "php",
    "php-bcmath",
    "php-cli",
    "php-devel",
    "php-common",
    "php-gd",
    "php-intl",
    "php-mbstring",
    "php-process",
    "php-xml",
    "php-mcrypt",
    "php-mysql",
    "php-pecl-apc"
  ]

  package { $phpPackages: 
    ensure  => "installed",
    require => [
      Yumrepo["remi-test"]
    ],
    notify  => Service['httpd'],
  }

  php::conf::line { "php_conf_link":
    line => "date.timezone = Europe/Madrid",
    require => Package["php"],
    notify  => Service['httpd'],
  }

 
}