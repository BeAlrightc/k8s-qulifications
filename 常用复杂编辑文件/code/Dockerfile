FROM centos:7
MAINTAINER 200250229 200250229@qq.com
ENV nginxver="1.20.2-1" \
    os="centos" \
    ver="7"
RUN yum install -y wget openssl sed &&\
    yum -y autoremove &&\
    yum clean all &&\
    wget http://nginx.org/packages/$os/$ver/x86_64/RPMS/nginx-$nginxver.el$ver.ngx.x86_64.rpm &&\
    rpm -ivh nginx-$nginxver.el$ver.ngx.x86_64.rpm
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /data/www/index.html
VOLUME [ "/data/www" ]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

