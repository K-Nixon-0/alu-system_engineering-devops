# Fixes a typo in the WordPress settings file that makes Apache return a 500 error
exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => ['/bin', '/usr/bin'],
}
