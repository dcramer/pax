develop: setup-git install-requirements

setup-git:
	pip install "pre-commit>=1.12.0,<1.13.0"
	pre-commit install
	git config branch.autosetuprebase always
	git config --bool flake8.strict true
	cd .git/hooks && ln -sf ../../hooks/* ./

install-requirements:
	poetry install
	ansible-galaxy install -r requirements.yml

all:
	ansible-playbook roles.yml

rex:
	ansible-playbook roles.yml -l rex

tower:
	ansible-playbook roles.yml -l tower

hass:
	ansible-playbook roles.yml -l rex -t hass

hass-ui:
	ansible-playbook roles.yml -l rex -t hass-ui

appd:
	ansible-playbook roles.yml -l rex -t appdaemon

es:
	ansible-playbook roles.yml -l rex -t es

docker:
	ansible-playbook roles.yml -l rex -t docker
