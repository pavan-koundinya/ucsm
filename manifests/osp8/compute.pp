class ucsm::osp8::compute {
  notify { "osp8 profile entered": }

  ucsm::mac_pool{'osp8':
    mac_pool_from => '...',
    mac_pool_to => '...',
  }

  ucsm::uuid_pool{'osp8':
    uuid_pool_from => '...',
    uuid_pool_to => '...',
  }

  ucsm::vlan{'PXE-Network':
    vlan_id => '...',
  }

  # 6 other (7 total) create_vlan resources

  ucsm::network_control_policy{'Enable_CDP':
    cdp => 'enabled',
  }

  ucsm::vnic_template{'PXE_NIC':
    descr => '...',
    fabric_id => '...',
    vlan_id => '...',
  }

  # 7 other (8 total) create_vnic_template resources

  ucsm::boot_policy{'PXE-Local-Boot':
    descr => '...',
    reboot_on_update => 'no',
    policy_owner => 'local',
    boot_mode => 'legacy',
    state => 'present',
    lan_boot_vnic => '...',
    lan_boot_order => '...',
    local_lun => '...',
    local_lun_order => '...',
  }

  ucsm::maintenance_policy{'Server_Ack':
    reboot_policy => '...',
  }

  ucsm::ipmi_access_policy{'IPMI-admin':
    ipmi_over_lan => '...',
  }

  ucsm::power_policy{'No_Power_Cap':
    descr => '...',
    fan_speed_policy => '...',
    power_capping => '...',
  }

  ucsm::qos_system_class{'qos':
    best_effort_mtu => '...',
  }

  ucsm::disk_group_policy{'BootDisk-OS':
    descr => '...',
    raid_level => '...',
    disk_config_slot1 => '...',
    disk_config_slot2 => '...',
  }

  ucsm::storage_profile{'Blade-OS-Boot',
    descr => '...',
    local_lun1 => '...',
    local_lun1_size => '...',
    local_lun1_disk_group => '...',
  }

  # storage server disk groups and profile

  ucsm::service_profile_template{'OSP8-Controller':
    uuid => '...',
    storage_profile => '...',
    vnic1_name => '...',
    vnic1_template => '...',
    boot_policy => '...',
    maintenance_policy => '...',
    ipmi_access_profile => '...',
    power_control_policy => '...',
  }

  # compute, storage, and installer SP templates

  ucsm::service_profile_instance{'OSP8-Controller':
    start_suffix => '...',
    number_instances => '...',
    sp_template => '...',
    server_assignement => '...',
  }

}
