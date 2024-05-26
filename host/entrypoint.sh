#!/bin/bash

service ssh start

ssh-keyscan lb1 >> /root/.ssh/known_hosts
ssh-keyscan lb2 >> /root/.ssh/known_hosts

ansible-playbook -i ansible/playbooks/inventory ansible/playbooks/playbook_main.yml