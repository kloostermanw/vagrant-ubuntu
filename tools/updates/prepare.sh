#!/usr/bin/bash

rsync -ar --exclude='authorized_keys' --exclude='known_hosts' /opt/tools/keys/ ~/.ssh/

echo "[defaults]" > ~/.ansible.cfg
echo "host_key_checking = False" >> ~/.ansible.cfg
echo "strategy = free" >> ~/.ansible.cfg
echo "stdout_callback = yaml" >> ~/.ansible.cfg
echo "sbin_ansible_callbacks = True" >> ~/.ansible.cfg