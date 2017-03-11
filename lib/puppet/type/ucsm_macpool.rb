Puppet::Type.newtype(:ucsm_macpool) do
  desc "Puppet type that manages macpool object"
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

  newproperty(:to) do
    desc "Reboot_on_update option set to either yes/no"
  end

  newproperty(:r_from) do
    desc "policy owner of the current managed object"
  end

  newproperty(:state) do
    desc "ensure whether the managed object is present or absent"
  end
end

