#!/bin/sh

AWX_VERSION=17.1.0
AWX_ADMIN_PASSWORD=password


test -d awx || git clone -b $AWX_VERSION https://github.com/ansible/awx.git

pushd awx/installer

ansible-playbook -i inventory install.yml \
		 -e compose_start_containers=false \
		 -e admin_password=$AWX_ADMIN_PASSWORD

popd

ansible-playbook modify-compose-file.yml


cd ~/.awx/awxcompose
docker-compose run --rm --service-ports task awx-manage migrate --no-input

sleep 10
docker-compose up -d

# Load demo data:
# docker exec awx_task bash -c "/usr/bin/awx-manage create_preload_data"
