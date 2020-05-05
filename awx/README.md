# What's in here?

If you follow the installation instructions at
https://github.com/ansible/awx/blob/devel/INSTALL.md#docker-compose, namely:

```
git clone -b 11.2.0 https://github.com/ansible/awx.git
	
cd awx/installer
	
ansible-playbook -i inventory install.yml
```

Then you get a directory `~/.awx/awxcompose`, which essentially contains
the stuff you find here.


# Changes to docker-compose.yml

Removed:

```
    ports:
      - "80:8052"
```

Added:

```
    labels:
      - traefik.enable=true
      - traefik.http.routers.awx.rule=Host(`awx.example.org`)
      - traefik.http.services.awx.loadbalancer.server.port=8052
      - traefik.http.routers.awx.tls=true
```

To every container:

```
    networks:
      - traefik
```

To task container:

```
    #environment:
      GIT_SSL_NO_VERIFY: 'true'
```

And finally:

```
networks:
  traefik:
    external: true
```


