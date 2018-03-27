# Search Image
`docker search {nom d'image}`

# MySQL
`docker run --name mysqlserver -v /host/dir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest`

# PhpMyadmin
`docker run --name myadmin -d --link mysqlserver -p 8080:80 -e PMA_HOST=mysqlserver phpmyadmin/phpmyadmin`

# PHP
`docker run -d php {fichier php}`
