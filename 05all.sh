#!/bin/sh
#功能简介：启动上层目录下的jar文件
#参数简介：
#    $1:jar文件名（包含后缀名）
#    注意：jar文件必须位于startup.sh目录的上一层目录。

#单机启动微服务
sh 04startup.sh app-eureka
sleep 30
sh 04startup.sh app-config
sleep 30
sh 04startup.sh app-auth
sleep 10
sh 04startup.sh app-passport
sleep 10

sh 04startup.sh app-portal-data
sleep 10
sh 04startup.sh app-portal
sleep 10
sh 04startup.sh app-mps
sleep 10

sh 04startup.sh app-gateway
sleep 10




