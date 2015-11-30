# ansible-ospdbs

## introduction

ansible-ospdbs is an ansible playbook to bootstrap a Red Hat OpenStack director server. It will provision a Satellite server, then configure itself to deploy a host with all the packages required for osp-d. If a libvirt target is given, Satellite will deploy a vm and install osp-d.

## prerequisites

- a valid mainfest.zip in roles/satellite/files
- a libvirt host to provision the ospd vm

## running it

set all the right configs in groups_vars/*. CHANGEME's have to be modified, the rest are defaults. pay attention to networks.

due to issues, this is split in to two playbooks. the first will deploy satellite, the second will deploy an ospd vm and deploy the undercloud. the goal is to do it in one run once the hammer issue is fixed.

for now:

* ansible-playbook -i hosts satellite.yml
* login to satellite cli and setup ssh keys for foreman -> hypervisor (see issues)
* pop in to satellite gui and provision the ospd vm against the hypervisor
* ansible-playbook -i hosts ospd.yml

## issues

until it is automated, between deploying satellite and ospd, create keys for foreman and ensure it can connect to the libvirt service:

~~~
root# su foreman -s /bin/bash
foreman$ ssh-keygen
foreman$ ssh-copy-id root@hostname.com
foreman$ ssh root@hostname.com
~~~

- the hammer command is not honouring the compute/libvirt specifics when using kvm. may be possible with curl until it is fixed (bz??). another hypervisor may work fine, but haven't test them yet (RHEV, VMware, etc)

## todo

- deploy ospd vm with hammer
- integrate satellite w/ 3rd party dns (external bind)
- deploy overcloud
