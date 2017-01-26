class profile::osp8::server_policies {
boot_policy{'PXE-Local-Boot':
        confuse => $params::confuse,
        descr => $params::descr,
        reboot_on_update => $params::reboot_on_update,
        policy_owner => $params::policy_owner,
        enforce_vnic_name => $params::enforce_vnic_name,
        boot_mode => $params::boot_mode,
        state => $params::state,
        ip => $params::ip,
        username => $params::username,
        password => $params::password,

}

}


class profile::osp8::install{
package { 'rubygems':
  ensure => present,
}

package { "json":
        ensure => 'installed',
        provider => 'gem',
        require => Package['rubygems'],
 }

package { "ucsmsdk":
    ensure => present,
    provider => "pip",
}
}

