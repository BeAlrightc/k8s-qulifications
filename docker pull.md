#                          docker 常用命令合集

## 对镜像的操作篇：

### docker push

描述：将本地镜像推送到公共仓库

用法

```
docker push [OPTIONS] NAME[:TAG]
```

OPTIONS；

- --disable-content-trust:忽略镜像的校验，默认校验

### docker pull

描述：从

#### dockerpull用法：

docker        pull    ----[OPTIONS  ]       NAME[ :  TAG |  @DIGEST ]

- --all-tags, -a：下载所有镜像

- --disable-content-trust ：跳过验证，默认值true

- --platform: 体验版（daemon)API 1.32+ 多平台进行选择

- --quiet ,-q：静默输出

  

### docker images

描述：列出本地镜像

#### dockerimages用法：

docker images [  OPTIONS  ]   [ REPOSITORY[ : TAG ] ] 

- -a：列出本地所有的镜像 （含中间映像层，默认情况下，过滤掉中间映像层）

- --digests：显示镜像的摘要信息

- --f：显示满足条件的镜像；

- --format：指定返回值的模块文件；

-  --no-trunc：显示完整的镜像信息；

- -q：只显示镜像ID

  

### docker search 

描述：搜索镜像

#### docker search用法

docker search [OPTIONS] TERM

选项：

- --automated
- --filter,-f：基于给定条件过滤输出
- --format：使用模版格式化显示输出
- --limit：Max number of search results,more值25
- --no-trunc：禁止截断输出
- --stars,-s：弃用，只显示收藏数不小于几颗星的镜像，移到--filter中使用

eg:

搜索收藏数不小于3且为自动化构建centos镜像，并完整显示镜像描述信息

```
[root@200250229-2~]#docker search --filter stars=3 --filter is-automated=true --no-trunc
```

### docker tag

描述：创建镜像标签

#### docker tag用法

docker tag SOURCE_IMAGE[: TAG]  TARGET_IMAGE[ : TAG]

### docker rmi

描述：删除镜像

删除全部镜像： docker rmi $(docker images -q)

#### docker rmi用法

docker rmi [OPTIONS] IMAGE [IMAGE...]

选项

- --force,-f：强制移除镜像

- --no-prune：不移除该镜像的过程镜像，默认移除

  ### docker load

描述：docker load ：导入使用docker save命令导出的镜像。

#### docker load用法

docker load [OPTIONS]

OPTIONS 说明：

- --input,-i:指定导入的文件，代替stdin.
- --quiet，-q：精简输出的信息。

eg:导入nginx.tar

```
[root@200250229-2~]#docker load --input nginx.tar
```

### docker run

描述：docker run：创建一个新的容器并运行一个命令

docker run [OPTIONS]  IMAGE [COMMAND]  [ARG...]

选项

- -a stdin：指定标准输入输出内容类型，可选STDIN/STDOUT/STDERR三项；
- -d：后台运行容器，并返回容器ID；
- -i：以交互模式运行容器，通常与-t同时使用；
- -P：随机端口映射，容器内部端口映射到主机的端口
- -p：指定端口映射，格式为：主机（宿主）端口：容器端口
- -t：为容器重新分配一个伪输入终端，通常与-i同时使用；
- --name="nginx-lb"：为容器指定一个名称；
- --dns 8.8.8.8：指定容器使用的DNS服务器，默认与主机一致
- --dns-search example.com：指定容器DNS搜索域名，默认和宿主一致；
- -h "mars"：指定容器的hostname;
- -e username="ritchie"：设置环境变量；
- --env-file=[]:从指定文件读入环境变量；
- --cpuset="0-2"or --cpuset="0,1,2"：绑定容器到指定CPU运行；
- -m：设置容器使用内存最大值；
- --net="bridge"：指定容器的网络连接类型，支持bridge/host/none/container：四种类型；
- --link=[]：添加链接到另一个容器；
- --expose=[]：开放一个端口或一组端口；
- --volume,-v：绑定一个卷

eg：通过docker run 命令启动一个registry容器，并挂载目录.

```
[root@200250229-2~]#docker run -d -p 5000:5000 --name registry250 -v /opt/registry:/var/lib/registry registry
```

### docker load

描述

docker load :导入使用 docker save命令导出的镜像

用法

```
docker load [OPTIONS]
```

OPTIONS说明：

- --input，-i:指定导入的文件，代替STDIN.
-  --quiet,-q :精简输出信息。

### **docker commit**

描述

docker commit :从容器创建一个新的镜像

用法

```
docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
```

options

- -a :提交的镜像作者
- -c:使用dockerfile指令来创建镜像
- -m:提交时的说明文字
- -p:在commit时，将容器暂停

## docker inspect

描述

docker inspect :获取容器/镜像的元数据

用法

```
docker inspect [OPTIONS] NAME|ID [NAME|ID...]
```

OPTIONS:

- --format,-f:指定返回值的模版文件
- --size,-s:显示总的文件大小
- --type:为指定类型返回JSON.

### docker build

描述：

docker build 命令用于使用Dockerfile创建镜像

用法

```
docker build [OPTIONS] PATH | URL
```

options

- --build-arg=[]:设置镜像创建时的变量
- --cpu-shares:设置cpu使用权重
- --cpu-period:限制CPU CFS周期
- --cpu-quota:限制CPU CFS配额
- --cpuset-mems:指定使用的内存id;
- --disable-content-trust:忽略校验，默认开启；
- -f:指定要使用的Dockerfile路径；
- --force-rm:设置镜像过程中删除中间容器
- --isolation:使用容器隔离技术
- --label=[]:设置镜像使用的元数据
- -m:设置内存最大值
- --memory-swap:设置Swap的最大内存为+swap,"-1"表示不限swap
- --no-cache:创建镜像的过程不使用缓存
- --pull:尝试去更新镜像的新版本
- --quiet,-q:安静模式，成功后只输出镜像ID;
- -rm:设置镜像成功后删除中间容器
- --shm-size:设置/dev/shm的大小，默认值是64M;
- --ulimit:Ulimit配置
- --tag,-t:镜像的名字及标签，通常name:tag或者name格式，可以在一次构建中为一个镜像设置多个标签，
- --network:默认default,在构建期间设置RUN指令的网格模式

## 容器操作篇

创建容器

```
docker create -it --name 镜像名 容器名
```

docker create:创建一个容器但不启动他

用法

```
docker create [options] IMAGE [command] [arg...]
```

options;

- -a stdin:指定标准输入输出内容类型，可选STDIN/STDERR三项；
- -d:后台运行容器，并返回容器id
- -i:以交互模式运行容器，通常与-t同时使用；
- -p :随机端口映射，容器内部端口随机映射到主机的端口
- -t:为容器重新分配一个伪输入终端，通常与-i同时使用；
- --name="nginx-lb":为容器指定一个名称·；
- --dns 8.8.8.8:指定容器使用的DNS服务器，默认和宿主机一致
- --dns-search example.com :指定容器DNS搜索域名，默认与宿主机一致；
- -h“mars":指定容器的hostname
- -e username="ritche":设置环境变量
- --env-file=[]:从指定文件读入环境变量；
- --cpuset="0-2"or --cpuset"0,1,2":绑定容器到指定的CPU运行
- -m:设置容器使用内存最大值；
- --net=“bridge”:指定容器的网络类型，支持bridge/host/none/container四种类型
- --link=[]:添加链接到另一个容器
- --expose=[]:开放一个端口或一组端口；
- --volume,-v;绑定一个卷

### 查看运行容器

```
docker ps
```

### 查看运行所有容器

```21/1/1/12
docker ps -a
```

docker ps 

描述

docker ps:列出容器

用法

```
docker ps [OPTIONS]
```

options:

- -a:显示所有的容器，包括未运行的。
- -f:根据条件过滤显示的内容
- --format:指定返回值的模版文件。
- -l:显示最近创建的容器
- -n:列出最近创建的n个容器。
- -no-trunc:不截断输出。
- -q:静默模式，只显示容器编号。
- -s:显示总的文件大小

### 启动容器

```
docker start 容器的name
```

描述

启动容器

用法

```
docker start [OPTIONS] CONTAINER [container]
```

options

- --attach,-a:打开输入输出并发送信号
- --checkpoint-dir:体验版(daemon)使用自定义检查点的目录
- --detach-keys:覆盖容器后太运行的一些参数信息
- --iteractive,-i:打开容器交互

### 进入容器

```
docker exec -it id或者name /bin/bash
```

退出容器

```
exit
```



### 停止某个容器

```
docker stop id或者name
```

### 停止运行中的所有容器

```
docker stop $(docker ps -q)
```



### 删除某个容器

```
docker rm id或name 
```

**docker rm** 

描述

删除容器

用法

```
docker rm [OPTIONS] CONTAINER [CONTAINER...]
```

选项：

- --force,-f:通过SIGKILL信号强制删除一个运行中的容器
- --link,-l:移除容器间的网络连接么费容器本身
- --volumes,-v:删除an与容器关联的卷

### 删除全部容器：

```
docker rm $(docker ps -aq)
```

### 使用一条命令删除并停止全部容器

```
docker stop $(docker ps -q) & docker rm $(docker ps -aq)
```

### docker import

描述

docker import:从归档文件中创建镜像

用法

```
dockerimport [OPTIONS] file |URL|- [REPOSITORY[:TAG] 
```

options

- --change,-c:应用docker指令创建镜像；
- --message,-m:提交时的说明文字；

docker export命令

docker export:将文件系统作为一个tar归档文件导出到STDOUT

```
docker export [OPTIONS] container
```

options:

- -o:将输入内容写到文件。
