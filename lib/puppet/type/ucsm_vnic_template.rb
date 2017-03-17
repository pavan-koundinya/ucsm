Puppet::Type.newtype(:ucsm_vnic_template) do
  desc "Puppet type that manages boot policy object"
  ensurable
  newparam(:typename ,:namevar => true) do
	desc "namevar for puppet object"
  end

  newproperty(:ip) do
	desc "The IP address of the ucspe server"
  end

  newproperty(:username) do
      validate do |value|
        unless value =~ /^\w+/
          raise ArgumentError, "%s is not a valid user name" % value
        end
	end
        desc "The username of ucspe user"
  end


  newproperty(:password) do
        desc "The password of ucspe user"
  end

  newproperty(:policy_name) do
    desc "The name of the managed object(This is with respect to ucspe)"
  end

  newproperty(:descr) do
    desc "The description of the managed object"
  end

  newproperty(:switch_id) do
    desc "Switch id  set to either 'A' or 'B' or 'A-B' to enable failover"
  end


  newproperty(:templ_type) do
    desc "option to enforce the vnic name .set to either yes/no"
  end

  newproperty(:vlan_name) do
    desc "boot mode for current managed object"
  end

  newproperty(:default_net) do
    desc "boot mode for current managed object"
  end

  newproperty(:cdn_source) do
    desc "boot mode for current managed object"
  end

  newproperty(:admin_cdn_name) do
    desc "boot mode for current managed object"
  end

  newproperty(:mtu) do
    desc "boot mode for current managed object"
  end

  newproperty(:ident_pool_name) do
    desc "boot mode for current managed object"
  end

  newproperty(:state) do
    desc "ensure whether the managed object is present or absent"
  end
end

