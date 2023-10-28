#
# = Class: rng
#
# Class for managing rng-tools
#
class rng (
  $rngd_args = '--fill-watermark=0 -x pkcs11 -x nist -x qrypt -D daemon:daemon'
) {

  package { 'rng-tools': }

  file { '/etc/sysconfig/rngd':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['rng-tools'],
  }

  service { 'rngd':
    ensure  => running,
    enable  => true,
    require => File['/etc/sysconfig/rngd'],
  }

}
# vi:syntax=puppet:filetype=puppet:ts=4:et:nowrap:
