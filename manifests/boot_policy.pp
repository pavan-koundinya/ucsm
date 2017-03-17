ucsm_boot_policy{'PXE-Local-Boot':
   	policy_name => "LOCAL-BOOT",
        order => "2",
	device_name => "firstlAN",
	type => "LocalLun",
        state => "present",
        ip => "172.31.219.215",
        username => "admin",
        password => "paasword",
}

