#!/bin/bash
if [ ! -d "home" ]; then
  mkdir home
fi

docker build -t gitbucket/img:1.1 .

docker run -d \
--net=host \
--name=gitbucket \
-v "$(pwd)/home":"/tank/data_dir" \
--env-file="./envs/default.env" \
gitbucket/img:1.1
