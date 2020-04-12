#!/bin/sh
mysqldump -uroot -proot mysite | gzip > /var/www/html/DBbackup/bc_$(date +%Y%m%d_%H%M%S).sql.gz
find /var/www/html/DBbackup -mtime +7 -name "*.sql.gz" -exec rm -rf {} \;
#end
