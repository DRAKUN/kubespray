# Welcome Pack

## Grooming to prepare your workspace

### Create the virtualenv to install all Python requirements

```
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Install Ansible addons roles 

```
ansible-galaxy install -fr requirements.yml
```

### Prepare your inventory

* Duplicate the `inventory/sample/` directory and rename with into your own workspace name.
* Adjust vars in the `group_vars/**/*.yml` files
* Fil you `hosts.ini` file with your hosts definitions.
* Adjust `ansible.cfg` to point to your preferred inventory file.
* Launch a `ansible -m ping all` just to check you have full connectivity to your target hosts.

## Install your cluster

```
ansible-playbook cluster.yml --skip-tags=external-provisioner
ansible-playbook extra_playbooks/external-addons.yml
ansible-playbook cluster.yml --tags=external-provisioner
```

## Integration

The files you are allowed to modify :

* requirements.yml
* extra_playbooks/external-addons.yml
* ansible.cfg
* Makefile

Please develop your addons as ansible roles and integrate them with the `extra_playbooks/external-addons.yml` playbook.
Read carefully the `Makefile` to understand the deployment logic.