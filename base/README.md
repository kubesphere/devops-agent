There're two base images based on different container runtime:

* Docker
* Podman

## Podman

In order to make it be easy to use. We provide some default conf files:

* [containers.conf](containers.conf)
* [registries.conf](registries.conf)
    * Add `docker.io` into the default registries for keeping compatible
* [storage.conf](storage.conf)

