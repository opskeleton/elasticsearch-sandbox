node default {

  include apt
  class{'jdk':
    version => 8
  }

	class { 'elasticsearch':
		java_install => false,
		manage_repo  => true,
		repo_version => '5.x',
	}

	elasticsearch::instance { 'es-01': }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>

}
