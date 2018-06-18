#!/bin/bash
docker build -t gitbucket/img:1.0 .

docker run -d \
--net=host \
--name=gitbucket \
-v 'home':'/tank/data_dir' \
--env-file="./envs/default.env" \
gitbucket/img:1.0
