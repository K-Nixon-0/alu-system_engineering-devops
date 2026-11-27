# Raises the Nginx open files limit so it can handle many concurrent requests
exec { 'fix--for-nginx':
  command => 'sed -i "s/-n 15/-n 4096/" /etc/default/nginx',
  path    => ['/bin', '/usr/bin'],
}

exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => ['/etc/init.d', '/usr/sbin', '/bin', '/usr/bin'],
  require => Exec['fix--for-nginx'],
}
