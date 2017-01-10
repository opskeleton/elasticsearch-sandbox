node default {

  include apt
  class{'jdk':
    version => 8
  }

  package{'ruby-augeas':
    ensure  => present
  } ->

  class { 'elasticsearch':
    java_install => false,
    manage_repo  => true,
    repo_version => '2.x',
  }

  elasticsearch::instance { 'es-01':
    config  => {
      network => {
          host => $::ipaddress_eth1
      }
    }
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>

}
