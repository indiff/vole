#!/usr/bin/env bash
# 打包項目
JAVA_OPTS="-server -Xms1048m -Xmx1048m -XX:PermSize=556m -XX:MaxPermSize=556M"
sudo mvn clean  package -U -B  -T 1C -DskipTests -Dmaven.compile.fork=true