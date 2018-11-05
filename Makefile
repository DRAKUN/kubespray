refresh-addons:
	ansible-galaxy install -fr requirements.yml

cluster:
	ansible-playbook cluster.yml --skip-tags=apps
	ansible-playbook extra_playbooks/external-addons.yml
	ansible-playbook cluster.yml --tags=apps

ping:
	ansible -m ping all