ucsm_storageprofile{'storageprofile':
policy_name => "pretest",
local_lun_list => [{"name" => "Boot-Lun","size" => "50","disk_group_configuration_name" => "pte88","slot_number" => ["1","2"]}, {"name" => "Data-Lun","size" => "20","disk_group_configuration_name" => "puppettes","slot_number" => ["1","2"]}],
ip => "172.31.219.215",
username => "admin",
password => "password",
state => "present",
}
