# ansible-ospdbs

## introduction

ansible-ospdbs is a set of ansible playbooks to bootstrap a Red Hat OpenStack director server. It will provision a Satellite server configured for provisioning and synced upped with all the packages required for osp-d. If a libvirt target is given, Satellite will deploy a vm and install osp-d on it.

## prerequisites

- a valid mainfest.zip in roles/satellite/files
- a libvirt host to provision the ospd vm. the vm should have one nic on the satellite dhcp network, and one on a dedicated vlan for osp-d provisioning
- overcloud images, downloaded from [here](https://access.redhat.com/downloads/content/191/ver=7/rhel---7/7/x86_64/product-downloads) or custom built and stored as .tar files in roles/openstack/files


## current state

these playbooks currently do the following:

- Deploys Red Hat Satellite on a provisioned host
     - Registers to RHN and enables proper repos
     - Configures firewall ports for Satellite
     - Installs katello based on template/variables
     - Syncs required channels for OpenStack director
     - Configures Satellite for provisioning. (Creates subnets, associates proxy, activation keys, etc)
     - Configures a libvirt compute resource in Satellite
     - !!this is where a VM should then be built via hammer. the hammer syntax seems to support what I'm trying to do (see commented out code) but the call is not respecting my NICs. I'll look in to it, maybe file a bz. For now, you can go in to the GUI, create a new host with the libvirt source you supplied, with 2 nics and the specs you want.

- Deploys OpenStack director
     - Enables proper repos
     - Configures provisioning NIC
     - Creates stack user
     - Installs packages
     - Lays down an undercloud.conf via template/vars and runs openstack overcloud install
     - undercloud config (set up dns server, flavors)
     - uploads overcloud images in to glance@undercloud

## running it

- create group_vars/{openstack,satellite} and hosts based on their .ex examples
- customize files for your environment, with focus on networks
- copy a manifest.zip in to roles/satellite/files
- copy over discovery/deploy/overcloud tar images in to roles/openstack/files

due to issues, this is split in to two playbooks. the first will deploy satellite, the second will deploy an ospd vm and deploy the undercloud. the goal is to do it in one run once the hammer issue is fixed.

for now:

~~~
ansible-playbook -i hosts satellite.yml
~~~

* login to satellite cli and setup ssh keys for foreman -> hypervisor 
* pop in to satellite gui and provision the ospd vm against the hypervisor

~~~
* ansible-playbook -i hosts ospd.yml
~~~

## issues

until it is automated, between deploying satellite and ospd, create keys for foreman and ensure it can connect to the libvirt service:

~~~
root# su foreman -s /bin/bash
foreman$ ssh-keygen
foreman$ ssh-copy-id root@hostname.com
foreman$ ssh root@hostname.com
~~~



the hammer command is not honouring the compute/libvirt specifics when using kvm. may be possible with curl until it is fixed (bz??). another hypervisor may work fine, but haven't test them yet (RHEV, VMware, etc)

## todo

- deploy ospd vm with hammer
- integrate satellite w/ 3rd party dns (external bind)
- deploy overcloud
