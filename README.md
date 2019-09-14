<img src="./docs/images/sctcLogo.png" height=80></img>
App
-------
App 基于SpringCloud2.0的微服务框架

## 微服务架构的优点
* 按业务划分的微服务单元独立部署，运行在独立的进程中，服务之间没有任何耦合，具备良好的扩展性和复用性
* 服务之间通常采用 HTTP 通信，该通信机制与平台和语言无关
* 每个微服务都有自己的数据库，服务间数据库相互是独立
* 微服务采用自动化工具部署。Docker 容器技术是微服务最佳部署容器
* 服务集中化管理（服务注册与发现：Eureka、Zookeeper、Consul），监控（服务运行状况监控：Spring-Boot-Admin-Server）
* 微服务架构是分布式架构

## Features
* 基于Eureka的服务管理
* 基于Spring-Cloud-Config的配置管理
* 基于Spring-Oauth2的jwt鉴权服务
* 基于Zuul的网关服务
* 基于Elastic-Job的分布式job
* 基于ShardingSphere的分库分表
* 基于SpringAdmin的监控服务
* 基于Zipkin的链路监控服务
* 基于SpringCloudStream的消息驱动
* 基于SpringSecurity的cookie的sso统一登陆服务
* 支持分布式后台portal统一服务
* 支持网关的动态配置和流量控制
* 支持SpringSession的session管理
* 支持Redis的数据服务缓存
* 支持Hystrix的服务熔断管理
* 支持swagger2的api管理
* 支持Kafka,RabbitMQ,Rocketmq的消息接入
* 支持Spring-Oauth2的sso
* 支持Spring-Security的cas客户端
* 支持FastDfs的客户端


## Docker
使用 docker-compose 部署Docker镜像


## 架构
![](./docs/images/arch.png)


## 组件
vole由`eureka`, `auth`,`config`,`gateway`,`mps`,`passport`,`portal`,`modules`组成

### Eureka
Eureka服务发现管理,支持高可用配置[更多](./docs/eureka.md)。

### Auth
Spring Oauth2鉴权管理支持jwt鉴权[更多](./docs/auth.md)。

### Config
Spring config的配置服务管理[更多](./docs/config.md)。

### Gateway
Zuul的网关服务，支持动态配置网关[更多](./docs/gateway.md)。

### Mps
会员管理中心[更多](./docs/mps.md)。

### Passport
后台统一登陆管理[更多](./docs/passport.md)。

### Portal
后台管理中心[更多](./docs/portal.md)。

### Modules
相关任务，消息，监控等组件[更多](./docs/modules.md)。
