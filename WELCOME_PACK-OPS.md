# Welcome Pack - Ops Edition

## Workspace grooming

### Create the virtualenv to install all Python requirements

```
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Install Ansible addons roles 

```
make refresh-addons
```

### Prepare your inventory

* Duplicate the `inventory/sample/` directory and rename with into your own workspace name.
* Adjust vars in the `group_vars/**/*.yml` files
* Fill your `hosts.ini` file with your hosts definitions.
* Adjust `ansible.cfg` to point to your preferred inventory file.
* Launch a `make ping` just to check you have full connectivity to your target hosts.

## Install the whole cluster

```
make cluster
```

## Integration

The files you are allowed to modify :

### requirements.yml

Here goes the addon roles to be installed by `ansible-galaxy`

* requirements.txt
* integration/*
* ansible.cfg
* Makefile

Please develop your addons as ansible roles and integrate them with the `extra_playbooks/external-addons.yml` playbook.
Read carefully the `Makefile` to understand the deployment logic.