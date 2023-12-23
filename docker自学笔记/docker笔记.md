                         Docker 学习

弱小和无知不是生存的障碍，傲慢才是

## 1.Docker概述

一款产品：开发上线两套环境：应用环境，应用配置

开发 ---运维 ：我在我的电脑上可以运行！版本更新，导致服务不可用。

环境配置十分麻烦，每一个机器都要部署环境（集群Redis,es,hadoop...）费时费力。发布一个项目(Redis,mysql,jdk,es)项目能不能带上环境一起打包！

之前在服务器配置一个应用的环境Redis,MySql,,mysql,jdk,es,hadoop,配置超麻烦，不能够跨平台。

传统：开发jar,运维来做

java -apk (应用商店) ----张三使用APK----安装即可

java --jar(环境) ----打包项目带上环境(镜像) ----(Docker仓库，商店) ----下载发布的镜像---直接运行即可

现在：打包部署，上线一套流程做完！

Docker给以上问题解决方案

Docker的思想来自集装箱！

JRE---多个应用(端口冲突) ----原来是交叉的

镜离：Docker核心思想！打包装箱！每个箱子是互相隔离的。通过隔离机制，可以将服务器利用到极致

本质：所有的技术都是因为出现了一些问题，我们需要去解决才去学习。

## 2.Docker历史

2010年，几个搞IT的年轻人成立一家公司dockerCloud做pass的云计算服务 LXC有关的容器技术!

他们将自己的技术(容器化技术)命名为Docker，docker诞生的时候，没有引起注意dotCloud就活不下去

开源

开放源代码！

2013年，Docker开源！

Docker，越来越多的人发现了docker的优点，Docker每个月都会更新一个版本，2014年4月9日Docker1.0发布！

Docker为什么会那么火？**十分的轻巧**

在容器技术出来之前，我们都是使用虚拟机技术！

虚拟机：在windows中装一个Vmare，通过这个软件我们就可以虚拟出来一台或者多台电脑！笨重

虚拟机也是属于虚拟化技术，Docker容器技术，也是虚拟机技术

vm,linux centos镜像(一个电脑) 隔离：需要开启多个虚拟机！

docker:隔离，镜像（4m +jdk+mysql）十分小巧，运行镜像就可以了！小巧 几个Mb KB 秒级启动

到现在所有开发人员去学习docker

docker知识：docker是基于go语言开发的，开源项目！

官网：https://www.docker.com

文档地址：https://docs.docker.com/Docker的文档是超级详细的。

仓库地址:http://hub.docker.com/

Docker能干嘛

1. ### 虚拟机：

![](C:\Users\CHUAN GE PALY\Desktop\docker学习资料\docker自学笔记\picture\虚拟机.jpg)

虚拟机的技术缺点：

1. 资源占用十分多
2. 冗余步骤多
3. 启动慢

### 容器化技术

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\容器技术.jpg)

容器化技术不是模拟一个完整的操作系统

比较Docker和虚拟机技术的不同：

- 传统虚拟机：虚拟出硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件
- 容器内的应用直接运行在宿主机的内核，容器是没有内核的，也没有虚拟硬件，所以轻便
- 每个容器间互相隔离，每个容器都有自己的一个文件系统互不影响

DevOps(开发，运维)

**应用更快速的交付和部署**

Docker;打包镜像 发布调试，一键运行

**更快捷的升级和缩容**

使用了Docker之后，我们部署应用就像搭积木一样！

项目打包成一个镜像，扩展，服务器A！服务器b.

**更简单的系统运维**

在容器化之后：我们的开发，测试环境部署都是高度一致的

**更高效的计算资源的利用**

Docker是内核级别的虚拟化，可以在一个物理机上运行很多的容器实例！服务器性能可以被压榨。



docker的基本构成

## 3.Docker命令

2.docker的底层原理

-1.docker是什么工作的

docker是一个Client-Server结构的系统。docker的守护进程运行在主机上，通过socket从客户端访问。DockerServer 接收docker-clent的指令，就会执行这个指令

-2.docker与全虚拟虚拟化对比

docker用的是宿主机的内核，vm是guest os

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\docker对比.jpg)

新建一个容器的时候，docker不需要像旧虚拟机一样重新加载一个操作系统，避免引导，虚拟机加载一个guestOS,docker用的是宿主机的操作系统，省略了复杂操作系统，docker是秒级的部分床V型·

### 3.docker常用命令

-1.帮助命令

```linux
docker version #显示docker的版本信息
docker info    #
docker 命令 --help
这些都是万能命令
```

帮助文档的地址docker官网中的docx目录中的getstart

-2.镜像命令

**docker images;**

```
docker images;#查看所有本地主机中的镜像
[root@lcc ~]# docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
centos_sshd   7         e7d8dcd6aa34   4 months ago    373MB
nginx         latest    605c77e624dd   9 months ago    141MB
centos        7         eeb6ee3f44bd   12 months ago   204MB
mysql         8.0.20    be0dbf01a0f3   2 years ago     541MB

REPOSITORY 镜像的仓库源
TAG  镜像的标签
IMAGE ID 镜像的ID
CREATED  镜像的创建时间
 SIZE  镜像的大小
 
 ##docker images的可选项：
 [root@lcc ~]# docker images --help

Usage:  docker images [OPTIONS] [REPOSITORY[:TAG]]

List images

Options:
  -a, --all             Show all images (default hides intermediate images)
      --digests         Show digests
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print images using a Go template
      --no-trunc        Don't truncate output
  -q, --quiet           Only show image IDs（只显示镜像的id）



```

docker中的搜索命令：**docker search +镜像名** 

```
[root@lcc ~]# docker search mysql
NAME                            DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
mysql                           MySQL is a widely used, open-source relation…   13234     [OK]
mariadb                         MariaDB Server is a high performing open sou…   5062      [OK]

##可选项通过搜索来过滤的
filter=STARTS=3000 #搜索出来的镜像就是大于3000的
[root@lcc ~]# docker search mysql --filter=STARS=3000
NAME      DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
mysql     MySQL is a widely used, open-source relation…   13234     [OK]
mariadb   MariaDB Server is a high performing open sou…   5062      [OK]


```

docker中拉取镜像的操作 **docker pull 镜像名**

```
[root@lcc ~]# docker pull tomcat #拉取tomcat的镜像操作命令
Using default tag: latest  #不加标签默认是latest
latest: Pulling from library/tomcat
0e29546d541c: Pull complete  #分层下载
9b829c73b52b: Pull complete
cb5b7ae36172: Pull complete
6494e4811622: Pull complete
668f6fcc5fa5: Pull complete
dc120c3e0290: Pull complete
8f7c0eebb7b1: Pull complete
77b694f83996: Pull complete
0f611256ec3a: Pull complete
4f25def12f23: Pull complete
Digest: sha256:9dee185c3b161cdfede1f5e35e8b56ebc9de88ed3a79526939701f3537 a52324#签名信息，防伪标志
Status: Downloaded newer image for tomcat:latest
docker.io/library/tomcat:latest

指定版本下载：
[root@lcc ~]# docker pull mysql:5.7
5.7: Pulling from library/mysql
72a69066d2fe: Pull complete
93619dbc5b36: Pull complete
99da31dd6142: Pull complete




```

删除镜像

```
[root@lcc ~]# docker image rm c20987f18b13
Untagged: mysql:5.7
Untagged: mysql@sha256:f2ad209efe9c67104167fc609cca6973c8422939491c9345270175a300419f94
Deleted: sha256:c20987f18b130f9d144c9828df630417e2a9523148930d
```

docker rmi -f  镜像D  #删除指定的镜像

docker rmi -f 镜像ID 镜像ID 镜像ID  #删除多个镜像

docker rmi -f $(docker images -aq )   #删除全部的镜像

-3.容器命令

说明：我们有了镜像才可以创建容器，linux,下载一个centos镜像来测试

```
docker pull centos
```

新建容器并启动

```
docker run -data(可选参数) image

#参数说明 
--name="Name"  容器名字 tomcat01 tomcat02 用来区分容器
-d   后台方式运行
-it   使用交互的方式运行，进入容器查看内容
-p 指定容器的端口 -- 8080:8080
  -p ip:主机端口:容器端口
  -p 主机端口：容器端口(常用)
  -p 容器端口
 -P 随机指定容器端口
 
 #测试
 启动并进入容器
 [root@lcc ~]# docker run -it centos /bin/bash
[root@ad16e014efb1 /]# ls #查看容器内的centos.基础镜像很多命令都是不完善的
bin  etc   lib    lost+found  mnt  proc  run   srv  tmp  var
dev  home  lib64  media       opt  root  sbin  sys  usr

从容器中退出命令为
exit



列出所有运行中的容器
[root@lcc ~]# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES



-a表示查看全部运行的容器，包括已经退出的容器
[root@lcc ~]# docker ps -a
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                          PORTS     NAMES
ad16e014efb1   centos         "/bin/bash"              4 minutes ago   Exited (0) About a minute ago             lucid_lederberg
b25c4a39b8df   mysql:8.0.20   "docker-entrypoint.s…"   2 months ago    Exited (0) 4 weeks ago                    mysql


-n 显示最近容器创建的个数
docker ps -n
[root@lcc ~]# docker ps -n2   #查看最近创建的容器只显示俩个
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                     PORTS     NAMES
ad16e014efb1   centos         "/bin/bash"              7 minutes ago   Exited (0) 4 minutes ago             lucid_lederberg
b25c4a39b8df   mysql:8.0.20   "docker-entrypoint.s…"   2 months ago    Exited (0) 4 weeks ago               mysql

-q 只显示容器的编号
docker ps -q
[root@lcc ~]# docker ps -aq  显示当前容器所有的编号
ad16e014efb1
b25c4a39b8df
c43c8cfd6a46
d58fb3f82e22
41d1a2eb07dd



```

退出容器

```
exit #直接停止容器并退出容器
Ctrl +P +Q退出容器但不停止
```

删除容器

```
docker rm 容器ID 删除指定的容器（不能删除只在运行的容器）
docker rm -f 容器id 删除正在运行的容器
docker rm -f $(docker ps -aq) #删除所有的容器
docker ps -a -q|xargs docker rm * 删除所有的容器
```

启动和停止容器的操作

```
docker start 容器id  #启动容器
docker restart 容器id #重启容器
docker  stop 容器id #停止当前正在运行的容器
docker kill 容器id  #强制停止当前容器
```

## 4.常用其他命令

-1.后台启动容器

```
命令 docker run -d 镜像名
[root@lcc ~]# docker run -d centos

#docker ps发现容器停止了

#常见的坑： docker 容器使用后台运行，就必须要有一个前台进程，docker发现没有应用。就会自动停止
#nginx 容器启动后，发现自己没有提供服务，就会立刻停止，就是没有程序了
```

-2.查看日志命令

```
docker logs -f -t --tail 容器，没有日志

#自己编写一个shell脚本让其不停输出狂神
"while true;do echo kuangshen;sleep 1 ;done"
[root@lcc /]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS     NAMES
f1bc8ff29e9b   centos    "/bin/sh -c 'while t…"   3 seconds ago   Up 2 seconds             exciting_dubinsky
#显示日志
-tf / -t -f #显示日志
--tail number #要显示的日志条数
[root@lcc /]# docker logs -f -t --tail 10 f1bc8ff29e9b
2022-10-01T08:37:50.338416161Z kuangshen
2022-10-01T08:37:51.341093302Z kuangshen
2022-10-01T08:37:52.343677841Z kuangshen
2022-10-01T08:37:53.345913271Z kuangshen
2022-10-01T08:37:54.348642556Z kuangshen
2022-10-01T08:37:55.352134240Z kuangshen
2022-10-01T08:37:56.354115107Z kuangshen
2022-10-01T08:37:57.356944156Z kuangshen
2022-10-01T08:37:58.359629945Z kuangshen
2022-10-01T08:37:59.362164192Z kuangshen
2022-10-01T08:38:00.364331107Z kuangshen
2022-10-01T08:38:01.366871085Z kuangshen

```

-3.查看容器中的进程信息

```
top 命令
docker top 容器id 查看容器的进程信息

[root@lcc /]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES
f1bc8ff29e9b   centos    "/bin/sh -c 'while t…"   11 minutes ago   Up 11 minutes             exciting_dubinsky

[root@lcc /]#  docker top f1bc8ff29e9b
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                94726               94707               0                   16:36               ?                   00:00:00            /bin/sh -c while true;do echo kuangshen;sleep 1;done
root                99807               94726               0                   16:48               ?                   00:00:00            /usr/bin/coreutils --coreutils-prog-shebang=sleep /usr/bin/sleep 1

```

-4.查看镜像的元数据

```
#命令 
docker inspect 容器id
测试，就可以看到该容器的元数据，，也就是关于该容器的全部信息
[root@lcc /]# docker inspect f1bc8ff29e9b
[
    {
        "Id": "f1bc8ff29e9b6b3298e4f256dc5b56247953ea41b5f8b95fa3d37b8bc58ffd48",
        "Created": "2022-10-01T08:36:20.707798733Z",
        "Path": "/bin/sh",
        "Args": [
            "-c",
            "while true;do echo kuangshen;sleep 1;done"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 94726,

```

-5.进入当前正在运行的容器

```
#我们通常容器都是使用后台方式运行的，查看进入容器，修改一些配置

#命令
方式1:
docker exec -it容器id bashshell
[root@lcc /]# docker exec -it f1bc8ff29e9b /bin/bash
方式2:
docker attach 容器id
测试
[root@lcc /]# docker attach  f1bc8ff29e9b
正在执行当前的代码


区别
docker exec  打开了一个新的命令，开启了一个新的终端，可以在里面操作（常用）
docker attach #进入容器正在执行的一个终端，不会启动新的进程

```

从容器内copy文件到主机上

```
docker cp 容器id:容器内的路径 目的主机的路径
#进入docker容器内部
[root@lcc home]# docker attach b53dca0e84b3
[root@b53dca0e84b3 /]# cd /home
[root@b53dca0e84b3 home]# ls
[root@b53dca0e84b3 home]# touch test.java #容器内新建一个文件
[root@b53dca0e84b3 home]# exit #退出来
exit
[root@lcc home]# docker ps #容器没运行但是数据任然在可以直接烤
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
#执行将容器内的数据copy到主机目录下面
[root@lcc home]# docker cp b53dca0e84b3:/home/test.java /home 
[root@lcc home]# ls
boat.java  mike  test.java
[root@lcc home]#
拷贝是一个手动的过程,未来使用数据卷


```

小结

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\docker基本命令小结.jpg)

以上都是最常用可基本的命令

## 5.作业来练习

-1.安装Nginx

```
[root@lcc ~]# docker pull nginx
#-d后台运行
#-name 给容器起名字
# 3.运行测试 curl
[root@lcc ~]# docker run -d --name nginx01 -p:3344:80 nginx
297404ab042015679a5ed4ce4fb9f634d1209600fbca1fe71384ba867fcc55f3
[root@lcc ~]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                   NAMES
297404ab0420   nginx     "/docker-entrypoint.…"   14 seconds ago   Up 12 seconds   0.0.0.0:3344->80/tcp, :::3344->80/tcp   nginx01
#进行测试
[root@lcc ~]# curl localhost:3344
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
进入容器
[root@lcc ~]# docker exec -it nginx01 /bin/bash
#查看nginx的配置文件所在的位置
root@297404ab0420:/# whereis nginx
nginx: /usr/sbin/nginx /usr/lib/nginx /etc/nginx /usr/share/nginx
root@297404ab0420:/# cd /etc/nginx
root@297404ab0420:/etc/nginx# ls
conf.d  fastcgi_params  mime.types  modules  nginx.conf  scgi_params  uwsgi_params


```

我们每次改动配置文件都要进入容器修改配置文件麻烦。我要是可以在容器外部提供一个映射路径，达到在容器外部就可以修改容器内部的配置文件就好了

使用docker装tomcat

```
#官方提供的方法
docker run -it --rm tomcat:9.0
#我们之前的是启动后台，停止了容器之后，容器还是可以查到 docker run -it --rm 容器在使用完之后就会被自动删除

#传统做法是先下载后启用
docker pull toimcat:9.0
docker run -d -p 3355:8080 tomcat

#测试访问没问题

进入容器
[root@lcc ~]# docker exec -it tomcat01 /bin/bash
root@fbe714e3f4d9:/usr/local/tomcat# ls
BUILDING.txt     NOTICE         RUNNING.txt  lib             temp          work
CONTRIBUTING.md  README.md      bin          logs            webapps
LICENSE          RELEASE-NOTES  conf         native-jni-lib  webapps.dist
#发现问题 1.linux命令少了，webapp下没东西，原因是：阿里云镜像，这是最小的镜像，所有不必要就被剔除了，保证最小可运行的环境
root@fbe714e3f4d9:/usr/local/tomcat# cp -r webapps.dist//* webapps #将webapps.dist下的所有东西复制到webapps下就可以成功访问了
docker容器加网站 docker +mysql

```

作业3 部署es+kibana

```
#es（elasticsearch）：暴露的端口很多，且十分耗内存 es的数据 一般需要放在安全目录中，挂载
#启动es
$ docker run -d --name elasticsearch --net somenetwork -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:tag
#启动了linux就卡住了
docker status 查看cpu的运行状态

docker run -d --name elasticsearch  -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node"  -e  ES_JAVA_OPTIONS="-Xms64m -Xmx512m" elasticsearch:7.6.2

[root@lcc ~]# curl localhost:9200
{
  "name" : "046087933af5",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "b32xnXOvTSiHHwUqglxtaA",
  "version" : {
    "number" : "7.6.2",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "ef48eb35cf30adf4db14086e8aabd07ef6fb113f",
    "build_date" : "2020-03-26T06:34:37.794943Z",
    "build_snapshot" : false,
    "lucene_version" : "8.4.0",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}


```

## 6.可视化

-1.portainer

```
docker run -d -p 8088:9000 \
--restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer

```

-2.rancher()已学过

然后在浏览器访问8088端口就可以了

7.docker镜像理解

镜像是什么？

镜像是一种轻量级、可执行的软件包，用来打包软件运行环境和基于环境开发的软件，它包含某个运行某个软件所需的所有内容，包括代码、运行时、库、环境变量和配置文件。所有的软件直接打包成docker镜像，就可以直接跑起来。

如何得到镜像？

- 从远程仓库中下载
- 朋友Copy自己制作一个镜像dockerfile

镜像加载原理

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\镜像加载.jpg)

如何提交一个镜像

commit镜像

```
docker commit #提交容器成为一个新的镜像
与git类似
docker commit -m "提交的描述信息" -a="作者" 容器id 目标镜像名，[Tag]
```

实战测试

```
#启动一个默认的tomcat
#发现这个tomcat中webapps目录没有东西，官方镜像的原因
#自己加一些东西进去
[root@lcc ~]# docker commit -a="liu" -m ="add webapps app" bf057c0973ff tomcat02:1.0
sha256:a258c9c225edc9fc08822b9132f8c29447ca581f30d4808aba547cbfb2035f53
[root@lcc ~]# docker images
REPOSITORY            TAG       IMAGE ID       CREATED         SIZE
tomcat02              1.0       a258c9c225ed   6 seconds ago   684MB

```

入门了

深入精髓阶段！！！

## 7.容器数据卷

为什么要学这个数据卷？

解决容器之间有有一个数据共享技术！docker容器中产生的数据，同步到本地

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\数据卷.jpg)

总结：容器的持久化和同步

使用数据卷

```
way1:使用命令的方式进行挂载
docker run -it -v 主机目录:容器目录 
[root@lcc home]# docker run -it -v /home/ceshi:/home centos /bin/bash
将容器内的home目录映射为主机的 /home/ceshi

```

主机进入 /home/ceshi

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\主机1.jpg)

进入容器的home目录进行查看

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\容器1.jpg)

发现容器与主机映射的目录是相互同步的，即使容器已经停止，但是数据依然可以和主机进行同步操作

好处是：在本地修改容器即可，容器内会自动同步。

实战测试
安装Mysql

```
思考：Mysql数据持久化的问题！
#获取镜像
[root@lcc home]# docker pull mysql:5.7
5.7: Pulling from library/mysql
72a69066d2fe: Pull complete

执行
#-d 后台运行
#-p 端口映射
#-v 数据卷挂载
#-e 环境配置
#--name 容器名字
docker run -d -p 3310:3306 -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql:5.7

启动成功后就可以在本地进行使用该数据库了，可以使用外部连接工具进行测试
输入ip地址 端口号就可以成功连接上mysql了

3310与容器内的3306进行映射操作！！
假设将容器删除发现在本地的数据卷依然没有删除，这就是数据持久化
```

具名和匿名挂载

```
#匿名挂载
-v 容器内路径
docker run -d -P --name nginx01 -v /etc/nginx nginx
#查看所有为volume卷情况
[root@lcc home]# docker volume ls
local     9b1eb3894ac1cbcbfe3dd172b8c16f62e898187eb8d365925d198d5bed178025
#这里发现，这种就是匿名挂载，我们就是在 -v 只写了容器内的路径，没有写容器外的路径
#具名挂载
[root@lcc home]# docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx nginx
44caccedf9d42d7c886373251d93873289505a56434637fcd932b58abb4a556a

[root@lcc home]# docker volume ls
DRIVER    VOLUME NAME
local     9b1eb3894ac1cbcbfe3dd172b8c16f62e898187eb8d365925d198d5bed178025
local     871de974486147f6c5f61b72f316ed6b1e30a1187811321edeb85b8dbeff46f5
local     f1897bd104331f90d227355354a79d8164f4c91122adb7d75892f4612b6d5a3e
local     juming-nginx #具名挂载

#通过-v 卷名:容器内路径
#查看卷名
[root@lcc home]# docker volume inspect juming-nginx
[
    {
        "CreatedAt": "2022-10-02T03:08:39+08:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/juming-nginx/_data",
        "Name": "juming-nginx",
        "Options": null,
        "Scope": "local"
    }
]
#所有的docker容器内的卷，没有指定目录的情况下都是在 /var/lib/docker/volumes/xxxx/_data

#查看路径的内容
[root@lcc home]# cd /var/lib/docker/volumes/
[root@lcc volumes]# ll
total 24
drwx-----x 3 root root    18 Jul 18 16:36 871de974486147f6c5f61b72f316ed6b1e30a1187811321edeb85b8dbeff46f5
drwx-----x 3 root root    18 Oct  1 20:01 9b1eb3894ac1cbcbfe3dd172b8c16f62e898187eb8d365925d198d5bed178025
brw------- 1 root root  8, 3 Oct  1 12:17 backingFsBlockDev
drwx-----x 3 root root    18 Oct  2 03:01 f1897bd104331f90d227355354a79d8164f4c91122adb7d75892f4612b6d5a3e
drwx-----x 3 root root    18 Oct  2 03:08 juming-nginx
-rw------- 1 root root 32768 Oct  2 03:08 metadata.db


```

我们通过具名挂载可以方便的找到我们的一个卷。大多数情况下使用的都是具名挂载，不建议匿名

```
#如何确定是具名挂载还是匿名挂载还是指定路径挂载
-v 容器内路径 #匿名挂载
-v 卷名:容器内路径 #具名挂载
-v /寄主机路径:容器内路径 #指定路径挂载
```

拓展

```
#通过-v容器内路径:ro rw 改变读写权限
ro --readonly #只读
rw --readwrite #可读可写
#一旦这个设置了容器权限，容器对我们挂载出来的内容就有限定了
ro--只能通过宿主机来操作，在容器内部是无法操作的！
[root@lcc _data]# docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx:ro nginx
rw
[root@lcc _data]# docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx:rw nginx
```



dockerFile

-1初识dockerfile

dockerfile就是用来构建docker镜像的构建文件 ！命令脚本！启动执行就可以了

通过这个脚本就可以生成一个镜像：

```
先创建一个存放dockerfile的目录
mkdir docker-test-volume
创建一个dockerfile
文件中的内容
FROM centos

VOLUME ["volume01","volume02"] #在创建镜像的时候就进行挂载

CMD echo "------end-------"
CMD /bin/bash

执行该文件doockerfile
[root@lcc docker-test-volume]# docker build -f /home/docker-test-volume/dockerfile1 -t kuangshencentos/centos:1.0 .

```

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\写dockerfile.jpg)

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\构建build.jpg)

```
#启动一下自己写的容器
[root@lcc ~]# docker run -it 9c8756c897a7  /bin/bash
[root@984391ccf559 /]# ls -l
total 24
lrwxrwxrwx   1 root root    7 Nov  3  2020 bin -> usr/bin
drwxr-xr-x   5 root root  360 Oct  1 20:15 dev
drwxr-xr-x  55 root root 4096 Oct  1 20:15 etc
drwxr-xr-x   2 root root    6 Nov  3  2020 home
lrwxrwxrwx   1 root root    7 Nov  3  2020 lib -> usr/lib
lrwxrwxrwx   1 root root    9 Nov  3  2020 lib64 -> usr/lib64
drwx------   2 root root    6 Sep 15  2021 lost+found
drwxr-xr-x   2 root root    6 Nov  3  2020 media
drwxr-xr-x   2 root root    6 Nov  3  2020 mnt
drwxr-xr-x   2 root root    6 Nov  3  2020 opt
dr-xr-xr-x 198 root root    0 Oct  1 20:15 proc
dr-xr-x---   2 root root 4096 Sep 15  2021 root
drwxr-xr-x  11 root root 4096 Sep 15  2021 run
lrwxrwxrwx   1 root root    8 Nov  3  2020 sbin -> usr/sbin
drwxr-xr-x   2 root root    6 Nov  3  2020 srv
dr-xr-xr-x  13 root root    0 Oct  1 20:15 sys
drwxrwxrwt   7 root root 4096 Sep 15  2021 tmp
drwxr-xr-x  12 root root  144 Sep 15  2021 usr
drwxr-xr-x  20 root root 4096 Sep 15  2021 var
drwxr-xr-x   2 root root    6 Oct  1 20:15 volume01 这两个目录就是我们生成镜像的时候自动挂载的，数据卷目录
drwxr-xr-x   2 root root    6 Oct  1 20:15 volume02
[root@984391ccf559 /]#
此方式我们使用的非常

```

数据卷容器

多个mysql同步数据

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\数据卷容器.jpg)

```
#用自己创建的镜像创建一个容器
[root@lcc ~]# docker run -it --name docker01 kuangshencentos/centos:1.0
进入之后查看发现有volume01和volume02这个两个数据卷目录
再使用那个镜像创建一个docker02的容器并依赖于docker01
[root@lcc ~]# docker run -it --name docker02 --volumes-from docker01 kuangshencentos/centos:1.0 #数据卷容器
然后进入docker01在volume01的目录建一个文件发现在docker02容器内的volume01中也会出现。就实现了两个容器的数据卷文件同步

```

测试：可删除docker01再查看docker02文件是否还在，结果依旧存在，这个一种数据备份机制（双向拷贝机制）



实例：多个mysql实现数据共享

```
docker run -d -p 3310:3306 -v /etc/mysql/conf.d -v /var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql:5.7


docker run -d -p 3310:3306 -v  -e MYSQL_ROOT_PASSWORD=123456 --name mysql02 --volumes-from mysql01 mysql:5.7

z#这个时候可以实现两个容器数据同步
结论：
容器之间配置信息的传递，数据卷容器的生命周期一直持续到没有容器使用为止。
但是一旦持久化到了本地，这个时候，本地的数据是不会删除的！
```



DockerFile

dockerfile是用来构建docker镜像的文件！命令参数脚本！

构建步骤：

1. 编写一个dockerfile文件
2. docker build 构建成为一个镜像
3. docker run 运行镜像
4. docker push 发布镜像(Dockerhub 阿里云镜像仓库)

dockerfile构建过程

基础知识

1.每个保留关键字（指令）都是必须大写字母

2.执行从上到下顺序执行

3.#表示注释

4每一个指令都会创建一个新的镜像层，并提交

如图架构

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\dockerfile构建.jpg)

dockerfile是面向开发的，我们以后要发布项目，作镜像，就要编写dockerfile文件，这个文件十分简单！

docker镜像逐渐成为企业的标准,必须掌握

dockerfile：构建文件定义了一切的步骤，源代码

diockerimages：通过dockerfile构建生成的镜像，最终发布和运行的产品，原来是war或者jar包

docker容器：容器就是镜像运行起来提供服务的

Dockerfile指令说明：

以前使用别人的，现在我们自己写自己的镜像

```
FROM   #基础镜像，一切从这里开始
MAINTAINER    #镜像是谁写的（留姓名加邮箱）
RUN           #docker镜像构建的时候需要运行的命令
ADD           #步骤;tomcat镜像，这个tomcat压缩包，添加内容
WORKDIR       #镜像的工作目录
VOLUME        #挂载的目录位置
EXPOSE        #暴露端口配置

CMD           #指定这个容器启动的时候要运行的命令（只有最后一个会生效）可被替代
ENTRYPOINT    #指定这个容器启动的时候要运行的命令 ，可以追加命令
ONBUILD       #当构建一个被继承dockfile这个时候会运行ONBUILD的指令，触发指令
COPY          #类似ADD,将我们的文件拷贝到镜像中
ENV           #构建的时候设置环境变量
```

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\dockerfoile指令.jpg)

实战：构建自己的centos

DockerHub中99%的镜像都是从基础镜像过来的FROM scratch ,然后配置需要的软件和配置来进行构建

创建自己的centos

```
#1.编写dockerfile的文件
[root@lcc dockerfile]# cat mydockerfile
FROM centos
MAINTAINER liuchengchuan<3288971507@qq.com>

ENV MYPATH /usr/local
WORKDIR $MYPATH
RUN yum -y install vim
RUN yum -y install net-tools

EXPOSE 80

CMD echo $MYPATH
CMD echo "-----end-----"
CMD /bin/bash

#2.通过这个文件构建镜像
docker build -f mydockerfile -t mycentos:0.1 .
返回Successfully built 027e69357972
Successfully tagged mycentos:0.1
#3.测试运行

[root@d4e095a87092 local]# pwd  #直接到了工作目录
/usr/local
[root@d4e095a87092 local]# ll
total 0
drwxr-xr-x 2 root root  6 Apr 11  2018 bin
drwxr-xr-x 2 root root  6 Apr 11  2018 etc
drwxr-xr-x 2 root root  6 Apr 11  2018 games
drwxr-xr-x 2 root root  6 Apr 11  2018 include
drwxr-xr-x 2 root root  6 Apr 11  2018 lib
drwxr-xr-x 2 root root  6 Apr 11  2018 lib64
drwxr-xr-x 2 root root  6 Apr 11  2018 libexec
drwxr-xr-x 2 root root  6 Apr 11  2018 sbin
drwxr-xr-x 5 root root 49 Nov 13  2020 share
drwxr-xr-x 2 root root  6 Apr 11  2018 src
[root@d4e095a87092 local]# vim 1.txt #成功
[root@d4e095a87092 local]# ifconfig #新加的命令成功
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:02  txqueuelen 0  (Ethernet)
        RX packets 8  bytes 656 (656.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

[root@d4e095a87092 local]#


```

我们可以；列出本地镜像的history

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\centos构建过程.jpg)

拿到一个镜像就可以研究一下怎么运行

CMD 和ENTRYPOINT的区别

```
CMD           #指定这个容器启动的时候要运行的命令（只有最后一个会生效）可被替代
ENTRYPOINT    #指定这个容器启动的时候要运行的命令 ，可以追加命令
```

测试cmd

```
[root@lcc dockerfile]# cat dockerfile-cmd-test
FROM centos:7
CMD ["ls","-a"]
构建执行
[root@lcc dockerfile]# docker build -f dockerfile-cmd-test -t cmdtest .
Sending build context to Docker daemon  3.072kB
Step 1/2 : FROM centos:7
 ---> eeb6ee3f44bd
Step 2/2 : CMD ["ls","-a"]
 ---> Running in 2ab7a672fc5d
Removing intermediate container 2ab7a672fc5d
 ---> 5a2f3a1f4152
Successfully built 5a2f3a1f4152
Successfully tagged cmdtest:latest
启动容器发现命令生效了
[root@lcc ~]# docker run 5a2f3a1f4152
.
..
.dockerenv
anaconda-post.log
bin
dev
etc
home
lib
lib64
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
失败
[root@lcc dockerfile]# docker run 5a2f3a1f4152 -l
docker: Error response from daemon: failed to create shim: OCI runtime create failed: container_linux.go:380: starting container process caused: exec: "-l": executable file not found in $PATH: unknown.
ERRO[0000] error waiting for container: context canceled
[root@lcc dockerfile]#


```

测试ENTRYPOINT

```
#编写dockerfile
[root@lcc dockerfile]# cat dockerfile-cmd-test
FROM centos:7
CMD ["ls","-a"]
构建
[root@lcc dockerfile]# docker build -f dockerfile-cmd-entrypoint -t entrypoint .
启动
[root@lcc ~]# docker run f6f7435df7b9
.
..
.dockerenv
anaconda-post.log
bin
dev
etc
home
lib
lib64
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
成功
[root@lcc ~]# docker run f6f7435df7b9 -l
total 28
drwxr-xr-x  16 root root  4096 Oct  1 23:23 .
drwxr-xr-x  16 root root  4096 Oct  1 23:23 ..
-rwxr-xr-x   1 root root     0 Oct  1 23:23 .dockerenv
-rw-r--r--   1 root root 12114 Nov 13  2020 anaconda-post.log
lrwxrwxrwx   1 root root     7 Nov 13  2020 bin -> usr/bin
drwxr-xr-x   5 root root   340 Oct  1 23:23 dev
drwxr-xr-x  47 root root  4096 Oct  1 23:23 etc
drwxr-xr-x   2 root root     6 Apr 11  2018 home
lrwxrwxrwx   1 root root     7 Nov 13  2020 lib -> usr/lib
lrwxrwxrwx   1 root root     9 Nov 13  2020 lib64 -> usr/lib64
drwxr-xr-x   2 root root     6 Apr 11  2018 media
drwxr-xr-x   2 root root     6 Apr 11  2018 mnt
drwxr-xr-x   2 root root     6 Apr 11  2018 opt
dr-xr-xr-x 148 root root     0 Oct  1 23:23 proc
dr-xr-x---   2 root root   114 Nov 13  2020 root
drwxr-xr-x  11 root root   148 Nov 13  2020 run
lrwxrwxrwx   1 root root     8 Nov 13  2020 sbin -> usr/sbin
drwxr-xr-x   2 root root     6 Apr 11  2018 srv
dr-xr-xr-x  13 root root     0 Oct  1 20:16 sys
drwxrwxrwt   7 root root   132 Nov 13  2020 tmp
drwxr-xr-x  13 root root   155 Nov 13  2020 usr
drwxr-xr-x  18 root root  4096 Nov 13  2020 var
[root@lcc ~]#

```

实战：Tomcat镜像

```
#1.准备镜像文件tomcat压缩包， jdk的压缩包

#2.编写dockerfile
FROM centos:7
MAINTAINER liu<1211@qq.com>

COPY readme.txt /usr/local/readme.txt

ADD jdk-8u161-linux-x64..gz /usr/local/
ADD apache-tomcat-9.0.22.tar.gz /usr/local/

RUN yum -y install vim

ENV MYPATH /usr/local
WORKDIR $MYPATH

ENV JAVA_HOME /usr/local/jdk1.8.0_161
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.22
ENV CATALINA_BASH /usr/local/apache-tomcat-9.0.22
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

EXPOSE 8080

CMD /usr/local/apache-tomcat-9.0.22/bin/startup.sh && tail -F /url/local/apache-tomcat-9.0.22/b
in/logs/catalina.out

构建镜像
[root@lcc tomcats]# docker build -t diytomcat .
Sending build context to Docker daemon  200.7MB
Step 1/15 : FROM centos:7
 ---> eeb6ee3f44bd
Step 2/15 : MAINTAINER liu<1211@qq.com>
 ---> Running in 7e6346cadb37
Removing intermediate container 7e6346cadb37
 ---> 0873598f188c
Step 3/15 : COPY readme.txt /usr/local/readme.txt

启动容器
[root@lcc tomcats]# docker run -d -p 9090:8080 --name liuchuan -v /home/tomcats/tomcat-test:/url/local/apache-tomcat-9.0.22/webapps/test -v /home/tomcats/tomcat-logs/:/url/local/apache-tomcat-9.0.22/logs diytomcat
b68f53a65b79e8a0e9e319170b0c183d88dfd48886befa8824c8f63424606bd4
[root@lcc tomcats]# ll
total 195992
-rw-r--r-- 1 root root  10929702 Oct  3 15:30 apache-tomcat-9.0.22.tar.gz
-rw-r--r-- 1 root root       629 Oct  3 16:37 Dockerfile
-rw-r--r-- 1 root root 189756259 Oct  2 08:36 jdk-8u161-linux-x64..gz
-rw-r--r-- 1 root root         0 Oct  3 15:13 readme.txt
drwxr-xr-x 2 root root         6 Oct  3 16:41 tomcat-logs
drwxr-xr-x 2 root root         6 Oct  3 16:41 tomcat-test
[root@lcc tomcats]# docker exec -it b68f53a65b79e8a0e9e319170b0c183d88dfd48886befa8824c8f63424606bd4 /bin/bash
[root@b68f53a65b79 local]# ls
apache-tomcat-9.0.22  etc    include       lib    libexec     sbin   src
bin                   games  jdk1.8.0_161  lib64  readme.txt  share
[root@b68f53a65b79 local]# cd apache-tomcat-9.0.22
[root@b68f53a65b79 apache-tomcat-9.0.22]# ll
total 132
-rw-r----- 1 root root 18982 Jul  4  2019 BUILDING.txt
-rw-r----- 1 root root  5407 Jul  4  2019 CONTRIBUTING.md
-rw-r----- 1 root root 57092 Jul  4  2019 LICENSE
-rw-r----- 1 root root  2333 Jul  4  2019 NOTICE
-rw-r----- 1 root root  3255 Jul  4  2019 README.md
-rw-r----- 1 root root  6852 Jul  4  2019 RELEASE-NOTES
-rw-r----- 1 root root 16262 Jul  4  2019 RUNNING.txt
drwxr-x--- 2 root root  4096 Jul  4  2019 bin
drwx------ 3 root root  4096 Oct  3 08:41 conf
drwxr-x--- 2 root root  4096 Jul  4  2019 lib
drwxr-x--- 2 root root  4096 Oct  3 08:41 logs
drwxr-x--- 2 root root    30 Jul  4  2019 temp
drwxr-x--- 7 root root    81 Jul  4  2019 webapps
drwxr-x--- 3 root root    22 Oct  3 08:41 work
[root@b68f53a65b79 apache-tomcat-9.0.22]#


进入主机挂载的目录，并添加网站
[root@lcc tomcats]# ll
total 195992
-rw-r--r-- 1 root root  10929702 Oct  3 15:30 apache-tomcat-9.0.22.tar.gz
-rw-r--r-- 1 root root       629 Oct  3 16:37 Dockerfile
-rw-r--r-- 1 root root 189756259 Oct  2 08:36 jdk-8u161-linux-x64..gz
-rw-r--r-- 1 root root         0 Oct  3 15:13 readme.txt
drwxr-xr-x 2 root root         6 Oct  3 16:41 tomcat-logs
drwxr-xr-x 2 root root         6 Oct  3 16:41 tomcat-test
[root@lcc tomcats]# cd tomcat-test/
[root@lcc tomcat-test]# ll
total 0
[root@lcc tomcat-test]# mkdir WEB-INF
[root@lcc tomcat-test]# ll
total 0
drwxr-xr-x 2 root root 6 Oct  3 16:47 WEB-INF
[root@lcc tomcat-test]# cd WEB-INF/
[root@lcc WEB-INF]# vim web.xml
[root@lcc WEB-INF]# cat web.xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.4"
    xmlns="http://java.sun.com/xml/ns/j2ee"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee
        http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">

</web-app>

[root@lcc WEB-INF]# cd ..
[root@lcc tomcat-test]# vim index.jsp
[root@lcc tomcat-test]# cat index.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>hello. xiaofan</title>
</head>
<body>
Hello World!<br/>
<%
System.out.println("-----my test web logs------");
%>
%</body>
%</html>
[root@lcc tomcat-test]# vim index.jsp
[root@lcc tomcat-test]# ll
total 4
-rw-r--r-- 1 root root 288 Oct  3 16:52 index.jsp
drwxr-xr-x 2 root root  20 Oct  3 16:51 WEB-INF
[root@lcc tomcat-test]#
接下来就可以成功进行访问了！！！


查看tomcat的日志
[root@lcc tomcats]#  cd tomcat-logs/
[root@lcc tomcat-logs]# ll
total 40
-rw-r----- 1 root root 13146 Oct  3 16:59 catalina.2022-10-03.log
-rw-r----- 1 root root 13174 Oct  3 17:00 catalina.out
-rw-r----- 1 root root     0 Oct  3 16:57 host-manager.2022-10-03.log
-rw-r----- 1 root root   816 Oct  3 16:59 localhost.2022-10-03.log
-rw-r----- 1 root root   594 Oct  3 17:00 localhost_access_log.2022-10-03.txt
-rw-r----- 1 root root     0 Oct  3 16:57 manager.2022-10-03.log
[root@lcc tomcat-logs]# cat catalina.out
03-Oct-2022 08:57:31.892 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version name:   Apache Tomcat/9.0.22
03-Oct-2022 08:57:31.896 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server built:          Jul 4 2019 14:20:06 UTC
03-Oct-2022 08:57:31.896 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version number: 9.0.22.0
03-Oct-2022 08:57:31.896 INFO [main] org.apache.catalina.startup.VersionLoggerListener成功
```

![](D:\myfile\云计算运维\docker学习资料\docker自学笔记\picture\访问网页.jpg)

发布自己的镜像

登录dockerhub

```
[root@lcc tomcat-test]# docker login --help

Usage:  docker login [OPTIONS] [SERVER]

Log in to a Docker registry.
If no server is specified, the default is defined by the daemon.

Options:
  -p, --password string   Password
      --password-stdin    Take the password from stdin
  -u, --username string   Username
[root@lcc tomcat-test]# docker login -u boatliu
Password:
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[root@lcc tomcat-test]#
#push操作
[root@lcc tomcat-test]# docker push liuchnegchuan/tomcat:1.0
The push refers to repository [docker.io/liuchnegchuan/tomcat]
55c1ff7da930: Preparing
b74580aa26e2: Preparing
95c4000ad1a2: Preparing
d1e4f41acc76: Preparing
174f56854903: Preparing
denied: requested access to the resource is denied



```



Docker网络

 
