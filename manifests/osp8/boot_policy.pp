class ucsm::osp8::boot_policy (
  $ip = '172.16.143.136',
  $username = 'username',
  $password = 'password',
  $boot_mode = 'uefi',
  $confuse = 'testing',
  $descr = 'testing boot policies',
) {
  notify { "osp8 profile entered": }

#  boot_policy{'PXE-Local-Boot':
  boot_policy{'policy':
    confuse => $confuse,
    descr => $descr,
    reboot_on_update => 'no',
    policy_owner => 'local',
    enforce_vnic_name => 'yes',
    boot_mode => $boot_mode,
    state => 'present',
    ip => $ip,
    username => $username,
    password => $password,
  }

}
