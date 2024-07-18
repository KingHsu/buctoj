### 部署说明

#### 使用阿里云服务器

公网IP为：8.130.11.95

操作系统为：Alibaba Cloud Linux 3.2104 LTS 64位

#### 使用宝塔Linux面板进行部署

将前后端项目打包文件以及数据库sql文件上传至服务器/www/wwwroot/目录下的frontend、backend以及data的子目录下

##### 后端部署：

创建虚拟终端：

```
tmux new -s backend
```

运行jar

```
java -jar /www/wwwroot/backend/acm-0.0.1-SNAPSHOT.jar
```

##### 前端部署：

使用Nginx，配置如下：

```
user  www www;
worker_processes auto;
error_log  /www/wwwlogs/nginx_error.log  crit;
pid        /www/server/nginx/logs/nginx.pid;
worker_rlimit_nofile 51200;

stream {
    log_format tcp_format '$time_local|$remote_addr|$protocol|$status|$bytes_sent|$bytes_received|$session_time|$upstream_addr|$upstream_bytes_sent|$upstream_bytes_received|$upstream_connect_time';

    access_log /www/wwwlogs/tcp-access.log tcp_format;
    error_log /www/wwwlogs/tcp-error.log;
    include /www/server/panel/vhost/nginx/tcp/*.conf;

}

events
    {
        use epoll;
        worker_connections 51200;
        multi_accept on;
    }

http
    {
        include       mime.types;
		#include luawaf.conf;

		include proxy.conf;
	    lua_package_path "/www/server/nginx/lib/lua/?.lua;;";
	
	    default_type  application/octet-stream;
	
	    server_names_hash_bucket_size 512;
	    client_header_buffer_size 32k;
	    large_client_header_buffers 4 32k;
	    client_max_body_size 50m;
	
	    sendfile   on;
	    tcp_nopush on;
	
	    keepalive_timeout 60;
	
	    tcp_nodelay on;
	
	    fastcgi_connect_timeout 300;
	    fastcgi_send_timeout 300;
	    fastcgi_read_timeout 300;
	    fastcgi_buffer_size 64k;
	    fastcgi_buffers 4 64k;
	    fastcgi_busy_buffers_size 128k;
	    fastcgi_temp_file_write_size 256k;
		fastcgi_intercept_errors on;
	
	    gzip on;
	    gzip_min_length  1k;
	    gzip_buffers     4 16k;
	    gzip_http_version 1.1;
	    gzip_comp_level 2;
	    gzip_types     text/plain application/javascript application/x-javascript text/javascript text/css application/xml application/json image/jpeg image/gif image/png font/ttf font/otf image/svg+xml application/xml+rss text/x-js;
	    gzip_vary on;
	    gzip_proxied   expired no-cache no-store private auth;
	    gzip_disable   "MSIE [1-6]\.";
	
	    limit_conn_zone $binary_remote_addr zone=perip:10m;
		limit_conn_zone $server_name zone=perserver:10m;
	
	    server_tokens off;
	    access_log off;

server
    {
        listen 8899;
        server_name phpmyadmin;
        index index.html index.htm index.php;
        root  /www/wwwroot/frontend/dist;

        #error_page   404   /404.html;
        include enable-php.conf;
    
        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
        {
            expires      30d;
        }
    
        location ~ .*\.(js|css)?$
        {
            expires      12h;
        }
    
        location ~ /\.
        {
            deny all;
        }
    
        access_log  /www/wwwlogs/access.log;
    }

include /www/server/panel/vhost/nginx/*.conf;
}


```

##### 数据库导入：

直接手动导入本机sql文件即可



