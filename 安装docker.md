安装docker详细操作步骤

```linux
删除旧版docker
yum remove docker docker-common docker-SELINUX docker-engine
或者
yum remove docker \
	docker-client \
	docker-client-latest \
	docker=common \
	docker-latest \
	docker-latest-logrotate \
	docker-logrotate \
	docker-engine
	
rm -rf /var/lib/docker/*
yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
yum list docker-ce --showduplicates | sort -r
yum install -y docker-ce
systemctl start docker && systemctl enable docker
sysctl -p
systemctl status docker
docker version

配置镜像加速器
vi /etc/docker/daemon.json
{
	"registry-mirrors":["https://docker.mirrors.ustc.edu.cn","http://hub-mirror.c.163.com"]
}


systemctl daemon-reload
systemctl restart docker
docker info
docker ps

```

