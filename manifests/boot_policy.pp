boot_policy{'PXE-Local-Boot':
   	policy_name => 'Local_boot_polic',
        descr => 'type  scription',
        reboot_on_update => 'no',
        policy_owner => 'local',
        enforce_vnic_name => 'yes',
        boot_mode => 'uefi',
        state => 'absent',
        ip => '172.31.219.215',
        username => 'username',
        password => 'password',
}

