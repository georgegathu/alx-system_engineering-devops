# Install Nginx web server (w/ Puppet)
package { 'nginx':
  ensure => installed,
}

file_line { 'redirect_rule':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  after  => 'listen 80 default_server;',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
