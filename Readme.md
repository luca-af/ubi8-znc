# ZNC on UBI 8 image
[![Docker Repository on Quay](https://quay.io/repository/elroncio/ubi8-znc/status "Docker Repository on Quay")](https://quay.io/repository/elroncio/ubi8-znc)

This container will use ubi8/ubi-minimal as base image to build and run ZNC bouncer.


## How to run


ZNC will start automatically with the option `--foreground`. It expect to find a valid configuration inside `/home/znc/`.
It can be started with:

```bash
$ podman run -d \
           -p [local_port]:[znc_port] \
           -u 1001 \
           -v /path/to/folder:/home/znc quay.io/elroncio/ubi8-znc
```

If you want to create a configuration for the first time, you can run it with:

```bash
$ podman run -it \
           -p [local_port]:[znc_port] \
           -u 1001 
           -v /path/to/folder:/home/znc quay.io/elroncio/ubi8-znc --makeconf
```


## ToDo:

- [ ] Better documentation
- [ ] Selinux option with Udica

