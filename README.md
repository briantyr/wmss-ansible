# wmss-ansible


Small ansible playbooks for updating &amp; upgrading Ubuntu VMs from 16.x to 22.x (latest version 22.04.2)


## Create virtualenv

### setup_ansible.sh

First step is to setup the virtual environment, and install the proper pip packages.  We can run `setup_ansible.sh` to create the virtualenv.

In this particular use case, we are running this code to upgrade from various versions of Ubuntu 16.x and 18.x to the latest (22.x.x).  

Execute `setup_ansible.sh`, create the virtualenv.


### Run playbook

Next steps would be to run the `playbook_main.yml` file.  Adjust the `inventory/wmss/hosts` file as needed, per your environment.

`ansible-playbok -i inventory/wmss/hosts playbook_main.yml -vv`
