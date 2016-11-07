#!/bin/bash

ansible-playbook -i hosts \
    k01-stop-wordpress.yml \
    k02-stop-nginx.yml \
    k90-stop-registry.yml \
    k99-cleanup.yml
