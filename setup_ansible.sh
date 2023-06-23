#!/usr/bin/env bash
#
# Ansible 7.4 environment setup
# Python 3.11.2 testing
#
# SOURCE THIS FILE, DO NOT RUN IT
# source setup_ansible.sh

if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
    echo "Hey, you should source this script, not execute it!"
    exit 1
fi

echo ""
echo "#################################"
echo "# Setting up Ansible VirtualEnv #"
echo "#################################"
echo ""

echo "# This virtualenv was created with Python 3.11.2 (homebrew). #"

# If you need to install these packages with pip, make sure
# you are within a virtualenv.

# Create with 'python3 -m venv ~/.virtualenv/ansible' and then source
# into the environment and use pip to install the packages
# with 'pip3 install -r requirements.txt'.




###############################################################`
# YOU NEED TO SOURCE THIS FILE TO ENTER THE VIRTUAL ENV
###############################################################`

export VENV_NAME="ansible-test-tmp"
function install_pip() {
	mkdir -p "$HOME/.virtualenvs" 
	if [[ -d "$HOME/.virtualenvs/${VENV_NAME}" ]]; then
		echo "VirtualEnv already exists at '$HOME/.virtualenvs/${VENV_NAME}'"
		return 0
	fi

	python3 -m venv "$HOME/.virtualenvs/${VENV_NAME}"
	if [[ $? -ne 0 ]]; then
		echo "# Failed to create the virtualenv.  Exiting.. #"
		return 1
	fi
	source "$HOME/.virtualenvs/${VENV_NAME}/bin/activate"
	if [[ $? -ne 0 ]]; then
		echo "# Failed to source into the virtualenv, exiting. #"
		return 1
	fi
	pip3 install -U -r requirements.txt
}

## If needed, run the install function to setup the virtualenv.
install_pip && echo "VirtualEnv is ready to use"  || echo "Failed to create/source virtualenv"

source "$HOME/.virtualenvs/${VENV_NAME}/bin/activate"

# After the virtualenv is up, we can run the playbook 'playbook_main.yml'.
