ucsm_boot_policy{'PXE-Local-Boot':
   	policy_name => "test_bootutrui",
        order => "1",
	device_name => "Boot-L",
	type => "LocalLun",
        state => "absent",
        ip => "172.31.219.215",
        username => "admin",
        password => "paasword",
}


