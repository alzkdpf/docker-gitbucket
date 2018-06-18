#!/bin/bash
chmod a+x /tank/war/gitbucket.war
java -jar /tank/war/gitbucket.war --port=$NUMBER --host=0.0.0.0 --max_file_size=$MAX_FILE_SIZE --gitbucket.home=/tank/data_dir