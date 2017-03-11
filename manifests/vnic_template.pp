ucsm_vnic_template {"vnicLanConnTempl":
policy_name =>"puppetdslmo",
descr => "abd40",
switch_id =>"A-B",
redundancy_pair_type => "none",
templ_type => "updating-template",
vlan_name => "default",
default_net =>"yes",
cdn_source => "user-defined",
admin_cdn_name =>"cdnname",
mtu => "1500",
ident_pool_name => "abcd",
ip => "172.31.219.215",
username => "admin",
password => "password",
state => "absent",


}
