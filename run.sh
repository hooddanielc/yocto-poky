#!/bin/bash -xe
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker run --rm \
  -e LOCAL_USER_ID=${UID} \
  -v $(dirname $DIR)/yocto-workspace:/data/workspace \
  -v $DIR/layers:/data/layers \
  -v $DIR/tools:/data/tools \
  -ti dhoodlum/yocto-docker /bin/bash
