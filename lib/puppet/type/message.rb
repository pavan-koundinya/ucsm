#
# Simple module for logging messages on the client-side
#

# available loglevels are:
# "debug","info","notice","warning","err","alert","emerg","crit"
Puppet::Type.newtype(:message) do
    @doc = "Sends an arbitrary message to the agent run-time log on the warning loglevel."

    newproperty(:message) do
      desc "The message to be sent to the log."
      def sync
        case @resource["withpath"]
        when :true
          send(@resource["level"], self.should)
        else
          Puppet.send(@resource["level"], self.should)
        end
        return
      end

      def retrieve
        :absent
      end

      def insync?(is)
        false
      end

      defaultto { @resource[:name] }
    end

    newparam(:withpath) do
      desc "Whether to show the full object path. Defaults to false."
      defaultto :false

      newvalues(:true, :false)
    end

    newparam(:name) do
      desc "An arbitrary tag for your own reference; the name of the message."
      isnamevar
    end

    newparam(:level) do
        desc "The loglevel to use when sending a message to the agent log"
        defaultto :info
        newvalues(:debug, :info, :notice, :warning, :err, :alert, :emerg, :crit)
    end

  end
