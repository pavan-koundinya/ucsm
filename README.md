# cisco-ucsm

#### Table of Contents
1. [Module Description](#Module-Description)
2. [Setup - The basics of getting started with ucsm](#setup)
3. [Example Manifests](#Example Manifests)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description
Cisco ucsm_dockerdc_puppet module allows administrators to automate all aspects of Cisco UCS management including server, network, storage and hypervisor management. Bulk of the Cisco ucsm_dockerdc_puppet module work on the UCS Manager’s Management Information Tree (MIT), performing create, modify or delete actions on the Managed Objects (MO) in the tree. 
The resources and capabilities provided by this Puppet Module will grow with contributions from Cisco, Puppet Labs and the open source community.
Dependencies

The ucsm_dockerdc_puppet module has a dependency on the ucsmsdk python library. See the Setup section that follows for more information on ucsmsdk.

Contributing

Contributions to the ciscopuppet module are welcome. See CONTRIBUTING.md for guidelines.

## Setup
Puppet Master

To install git use the following command :
   yum install git -y
The ucsm_dockerdc_puppet module must be cloned on the Puppet Master server. We recommend cloning in the modules directory.

   https://github.com/pavan-koundinya/ucsm.git 
  
To install pip package installer use the following commands.
   - curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
   - python get-pip.py
After pip is installed successfully install the ucsmsdk package using the following command.
   - pip install ucsmsdk
   
   


Software version Dependencies
   - Puppet 4.x
   - Python 2.7.x
   


## Example Manifests

Bios Policy example manifest:
The following example demonstrates how to define a manifest that uses ucsm_dockerdc_puppet module  to configure bios policy on a Cisco UCS.

ucsm_bios_policy{'biosVProfile':                                                                              
policy_name => "Docker-BiosPol",                                                                                   
descr =>"",                                                                                              
consistent_device_naming => "enabled",                                                                       
ip => "IP address of the UCS server",                                                                                       
username => "",                                                                                          
password => "",                                                                                       
state => "present",                                                                                           
}  
Description of parameters :

ucsm_bios_profile => The bios policy resource type defined in Puppet DSL. This is required to identify which resource we intend to configure.

policy_name => The name of the policy to be configured.

descr => Description for the policy.

consistent_device_naming => This parameter defines whether device naming should be consistent across all platforms.Allowed values are "enabled" or "disabled".

ip => the IP address of the UCS server.

username => The administrative username

password => The administrative password

state => This parameter ensures whether the policy should be present or absent on the UCS server.

Vlan example manifest :
The following example demonstrates how to define a manifest that uses ucsm_dockerdc_puppet module  to configure Vlan on a Cisco UCS.

ucsm_vlan{'fabricVlan':
policy_name => "vlan603",
id => "603",
default_net => "yes",
ip => "IP address of the UCS server",
username => "",
password => "",
state => "present",
}

Description of parameters :

ucsm_vlan => The Vlan resource type defined in Puppet DSL. This is required to identify which resource we intend to configure.

policy_name => The name of the policy to be configured.

default_net => If the newly created VLAN is a native VLAN then this parameter has to be set to "yes". Otherwise it should be set to "no".

id => The range of Vlan id's (e.g. "2009-2019","29,35,40-45","23","23,34-45")

ip => "the IP address of the UCS server"

username => The administrative username

password => The administrative password

state => This parameter ensures whether the policy should be present or absent on the UCS server.

Boot Policy example manifest :
The following example demonstrates how to define a manifest that uses ucsm_dockerdc_puppet module  to configure boot policy on a Cisco UCS.

ucsm_boot_policy{'PXE-Local-Boot':
        policy_name => "Docker-LocalBoot",
        order => "1",
        device_name => "Boot-Lun",
        type => "LocalLun",
        state => "present",
        ip => "the IP address of the UCS server",
        username => "",
        password => "",
}

Description of parameters :

ucsm_boot_policy => The boot policy resource type defined in Puppet DSL. This is required to identify which resource we intend to configure.

policy_name => The name of the policy to be configured.

order => The boot order for the boot device. 

device_name => The name of the device

type => The type of device (e.g. Local-Lun , Lan-Boot etc)

ip => the IP address of the UCS server.

username => The administrative username

password => The administrative password

state => This parameter ensures whether the policy should be present or absent on the UCS server.

Macpool example manifest :
The following example demonstrates how to define a manifest that uses ucsm_dockerdc_puppet module  to configure mac pool on a Cisco UCS.

ucsm_macpool{'macpoolPool':
policy_name => "macpool12",
descr =>"em",
to => "00:25:B5:00:00:14",
r_from => "00:25:B5:00:00:12",
ip => "IP address of UCS server",
username => "",
password => "",
state => "present",
}

Description of parameters :

ucsm_macpool => The mac pool resource type defined in Puppet DSL. This is required to identify which resource we intend to configure.

policy_name => The name of the policy to be configured.

descr => The description for the macpool. 

to => The end of mac pool address range

r_from => The start of mac pool address range

ip => the IP address of the UCS server.

username => The administrative username

password => The administrative password

state => This parameter ensures whether the policy should be present or absent on the UCS server.

Uuidpool example manifest :
The following example demonstrates how to define a manifest that uses ucsm_dockerdc_puppet module  to configure uuid pool on a Cisco UCS.

ucsm_uuid_pool{'Pool':
policy_name => "uuidPool1",
descr =>"",
to => "0000-000000000009",
r_from => "0000-000000000008",
ip => "IP address of UCS Server",
username => "",
password => "",
state => "present",
}

Description of parameters :

ucsm_uuid_pool => The uuid pool resource type defined in Puppet DSL. This is required to identify which resource we intend to configure.

policy_name => The name of the policy to be configured.

descr => The description for the uuidpool. 

to => The end of uuid pool address range

r_from => The start of uuid pool address range

ip => the IP address of the UCS server.

username => The administrative username

password => The administrative password

state => This parameter ensures whether the policy should be present or absent on the UCS server.

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
