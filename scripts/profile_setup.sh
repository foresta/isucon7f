#!/bin/bash

cd $(dirname $0)
root=`pwd`

#########
# nginx
#########
# access logを有効化
cd $root/../conf/nginx
sed -i -e "s/access_log off;/access_log \/var\/log\/nginx\/access.log;/" nginx.conf
rm -f nginx.conf-e

# nginxを再起動
sudo service nginx reload

#########
# mysql
#########

# slow queryを有効化
cd $root/../conf/mysql
sed -i -e "s/.*log_slow_queries .*/log_slow_queries = \/var\/log\/mysql\/mysql-slow.sql/" mysqld.cnf
# sed -i -e "s/.*slow_query_log .*/slow_query_log = 1/" mysqld.cnf
# sed -i -e "s/.*slow_query_log-file .*/slow_query_log-file = \/var\/log\/mysql\/mysql-slow.sql/" mysqld.cnf
sed -i -e "s/.*long_query_time .*/long_query_time = 0/" mysqld.cnf
rm -f mysqld.cnf-e

# mysqlを再起動
sudo service mysql restart
