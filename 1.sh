#!/bin/bash

#step3  停止旧的代码
ps -ef | grep "next" | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep "yarn" | grep -v grep | awk '{print $2}' | xargs kill -9
# kill -9  `pgrep -f start `

#step1  初始化代码
cd /data/ && rm -rf ./chatgpt-web
git clone git@github.com:wangbaoqi1/chatgpt.git

#step2 代码构建
cd /data/chatgpt-web && yarn && yarn build

#step4  启动新的程序
#cd /data/chatgpt-web && nohup yarn start   >>/root/chatgpt_yarn.log 2>&1 &
cd /data/chatgpt-web && nohup yarn start >>/dev/null 2>&1 &
