Puppet::Type.newtype(:ucsm_vlan) do
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

  newproperty(:sharing) do
    desc ""
  end
  newproperty(:id) do
    desc ""
  end
  newproperty(:mcast_policy_name) do
    desc ""
  end
  newproperty(:policy_owner) do
    desc ""
  end
  newproperty(:default_net) do
    desc ""
  end
  newproperty(:pub_nw_name) do
    desc ""
  end
  newproperty(:compression_type) do
    desc ""
  end
  newproperty(:state) do
    desc ""
  end
end
