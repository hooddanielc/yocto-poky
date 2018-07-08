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

run and mount your workspace. don't forget to pass LOCAL_USER_ID

```
docker run --rm -e LOCAL_USER_ID=${UID} -v $(pwd)/workspace:/data/workspace -ti dhoodlum/yocto-docker /bin/bash
```

directories

- yocto /data/poky
- workspace /data/workspace
