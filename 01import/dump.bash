mysqldump -h mydbinstance1.cqornbg3nzt3.us-east-1.rds.amazonaws.com -u dbadmin -p --databases mydb > mydb_dump.sql 

sudo docker run --name localmysql -e MYSQL_ROOT_PASSWORD=admin123 -p 3306:3306 -d mysql 

mysql -u root -p -h 0.0.0.0 < mydb_dump.sql

sudo docker exec -i localmysql sh -c 'exec mysql -uroot -p"admin123"' < /home/gregory/work/gregory/joaquin/utest/mydb_dump.sql