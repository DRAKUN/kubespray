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