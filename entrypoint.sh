#!/bin/bash -xe
useradd -u $LOCAL_USER_ID user
chown user /data/workspace
gosu user bash -xec "/data/start.sh $@"
