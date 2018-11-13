ssh-master:
	bash -c "ssh -F ssh.cfg `cat inventory/ali/hosts.ini | grep ansible_host | grep master-1 | cut -d '=' -f2 | cut -d ' ' -f1`"

ssh-node:
	bash -c "ssh -F ssh.cfg `cat inventory/ali/hosts.ini | grep ansible_host | grep node-1 | cut -d '=' -f2 | cut -d ' ' -f1`"

refresh-addons:
	ansible-galaxy install -fr requirements.yml

ext-bootstrap:
	ansible-playbook integration/ext-bootstrap.yml

cluster: ext-bootstrap
	ansible-playbook cluster.yml -e registry_enabled=false
	ansible-playbook integration/ext-apps.yml
	ansible-playbook cluster.yml -e registry_enabled=true

ping:
	ansible -m ping all

mitogen:
	ansible-playbook -c local mitogen.yaml -vv
clean:
	rm -rf dist/
	rm *.retry
