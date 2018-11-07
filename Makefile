ssh-master:
	bash -c "ssh -F ssh.cfg `cat inventory/ali/hosts.ini | grep ansible_host | grep master-1 | cut -d '=' -f2 | cut -d ' ' -f1`"

refresh-addons:
	ansible-galaxy install -fr requirements.yml

cluster:
	ansible-playbook extra_playbooks/ext-bootstrap.yml
	ansible-playbook cluster.yml
	ansible-playbook extra_playbooks/ext-apps.yml
	ansible-playbook cluster.yml --tags=

ping:
	ansible -m ping all

mitogen:
	ansible-playbook -c local mitogen.yaml -vv
clean:
	rm -rf dist/
	rm *.retry
