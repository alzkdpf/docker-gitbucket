#!/bin/bash
chmod a+x /tank/war/gitbucket.war
java -jar /tank/war/gitbucket.war --port=$NUMBER --host=$HOST --max_file_size=$MAX_FILE_SIZE --gitbucket.home=/tank/data_dir