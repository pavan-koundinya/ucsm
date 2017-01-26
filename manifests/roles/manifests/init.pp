class roles::osp8{

include profile::osp8::server_policies
include profile::osp8::install

Class['profile::osp8::install'] -> Class['profile::osp8::server_policies']
}
