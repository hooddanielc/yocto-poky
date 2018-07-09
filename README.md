yocto-docker
============

build the container

```
./build.sh
```

create a workspace

```
mkdir ~/workspace
```

run in container, workspace will be created and mounted at $ROOT_DIR/../yocto-workspace

```
./run.sh
```

directories

- poky - /data/tools/poky
- layers - /data/layers
- workspace - /data/workspace
