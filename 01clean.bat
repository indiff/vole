@echo off
set JAVA_OPTS="-server -Xms1048m -Xmx1048m -XX:PermSize=556m -XX:MaxPermSize=556M"
mvn clean   -U -B  -T 1C -DskipTests -Dmaven.compile.fork=true
pause