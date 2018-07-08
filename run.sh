#!/bin/bash -xe
docker run --rm -e LOCAL_USER_ID=${UID} -v $(pwd)/workspace:/data/workspace -ti dhoodlum/yocto-docker /bin/bash