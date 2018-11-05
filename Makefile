refresh-addons:
	ansible-galaxy install -fr requirements.yml

cluster:
	ansible-playbook cluster.yml --skip-tags=apps
	ansible-playbook extra_playbooks/external-addons.yml
	ansible-playbook cluster.yml --tags=apps

ping:
	ansible -m ping all

mitogen:
	ansible-playbook -c local mitogen.yaml -vv
clean:
	rm -rf dist/
	rm *.retry
