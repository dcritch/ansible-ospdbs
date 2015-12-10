---
# variables required to standup satellite
reg_method: "satellite" # rhn or satellite
# if registering satellite directly to red hat....
rhn_user: "CHANGEME"
rhn_password: "CHANGEME"
# if registering satellite to another satellite....
rhn_org: "CHANGME"
rhn_host: "satellite.example.com"
rhn_activation_key: "rhel-7-satellite"
# provisioning variables
dhcp_gw: "192.168.1.1"
dhcp_start: "192.168.1.240"
dhcp_end: "192.168.1.250"
dns_server: "192.168.0.254"
dns_zone: "example.com"
dns_rev_zone: "1.168.192.in-addr.arpa"
subnet_name: "192.168.1.x"
subnet_nw: "192.168.1.0"
subnet_mask: "255.255.255.0"
mgmt_int: "eth0"
satellite_admin: "CHANGEME"
satellite_password: "CHANGEME"
satellite_domain: "example.com"
satellite_ip: "192.168.1.205"
satellite_location: "libvirt"
satellite_org: "CHANGEME"
satellite_puppet_env: "production"
satellite_ak: "rhel-7-osp"
ntp_server: "192.168.0.254"
libvirt_host: "libvirt.example.com"
ospd_nw_name: "ospd"
ospd_nw: "192.168.100.0"
ospd_nw_mask: "255.255.255.0"
ospd_nw_gw: "192.168.100.1"
ospd_nw_start: "192.168.100.240"
ospd_nw_end: "192.168.100.250"
ospd_disc_start: "192.168.100.100"
ospd_disc_end: "192.168.100.120"
ospd_host: "ospd"
opsd_ip: "192.168.1.241"
ospd_prov_ip: "192.168.100.10"
ospd_nm: "255.255.255.0"
ospd_pub_vip: "192.168.100.20"
ospd_admin_vip: "192.168.100.21"
ospd_if: "eth1"

#repos
repos:
  rhel-7-ks:
    product: "Red Hat Enterprise Linux Server"
    name: "Red Hat Enterprise Linux 7 Server (Kickstart)"
    releasever: "7.2"
    basearch: "x86_64"
  rhel-7-base:
    product: "Red Hat Enterprise Linux Server"
    name: "Red Hat Enterprise Linux 7 Server (RPMs)"
    releasever: "7Server"
    basearch: "x86_64"
  rhel-7-common:
    product: "Red Hat Enterprise Linux Server"
    name: "Red Hat Enterprise Linux 7 Server - RH Common (RPMs)"
    releasever: "7Server"
    basearch: "x86_64"
  rhel-7-optional:
    product: "Red Hat Enterprise Linux Server"
    name: "Red Hat Enterprise Linux 7 Server - Optional (RPMs)"
    releasever: "7Server"
    basearch: "x86_64"
  rhel-7-supplementary:
    product: "Red Hat Enterprise Linux Server"
    name: "Red Hat Enterprise Linux 7 Server - Supplementary (RPMs)"
    releasever: "7Server"
    basearch: "x86_64"
#  rhel-7-extras:
#    product: "Red Hat Enterprise Linux Server"
#    name: "Red Hat Enterprise Linux 7 Server - Extras (RPMs)"
#    releasever: "7Server"
#    basearch: "x86_64"
#  rhel-7-satellite-tools:
#    product: "Red Hat Enterprise Linux Server"
#    name: "Red Hat Satellite Tools 6.1 (for RHEL 7 Server) (RPMs)"
#    releasever: "7Server"
#    basearch: "x86_64"
  rhel-7-openstack:
    product: "Red Hat OpenStack"
    name: "Red Hat Enterprise Linux OpenStack Platform 7.0 for RHEL 7 (RPMs)"
    releasever: "7Server"
    basearch: "x86_64"
  rhel-7-openstack-director:
    product: "Red Hat OpenStack"
    name: "Red Hat Enterprise Linux OpenStack Platform 7.0 director for RHEL 7 (RPMs)"
    releasever: "7Server"
    basearch: "x86_64"
  rhel-7-scl:
    product: "Red Hat Software Collections for RHEL Server"
    name: "Red Hat Software Collections RPMs for Red Hat Enterprise Linux 7 Server"
    releasever: "7Server"
    basearch: "x86_64"
