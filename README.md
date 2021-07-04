# Ubank_t
Ubank_t
## items

### rds installation reference 
Para realizar la automatización de la lectura de las bases de datos con AWS se utilizo la siguiente referencia:

https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-rds-database-instance.html

### cloud formation 
Para la instalacion de cloud formation, se utilizaron los comandos mencionados en al siguiente referencia:

https://docs.aws.amazon.com/cli/latest/reference/cloudformation/

### security
Open the IAM console at https://console.aws.amazon.com/iam/ .
On the navigation menu, choose Users.
Choose your IAM user name (not the check box).
Open the Security credentials tab, and then choose Create access key.
To see the new access key, choose Show. ...
To download the key pair, choose Download .

### groups 

### import sql data
https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.AnySource.html

sudo apt install mysql-client-core-8.0

aws rds modify-db-instance \
    --db-instance-identifier AcmeRDS \
    --backup-retention-period 1 \
    --apply-immediately


SELECT * from information_schema.user_privileges


GRANT SESSION_VARIABLES_ADMIN ON *.* TO 'dbadmin'@'%';



mysql --user=dbadmin --password --host=mydbinstance.cqornbg3nzt3.us-east-1.rds.amazonaws.com mydb < ./01import/ini.sql

mysqlimport --local --compress --user=dbadmin  --password  --host=mydbinstance.cqornbg3nzt3.us-east-1.rds.amazonaws.com --fields-terminated-by=',' mydb ./data/*.csv


#### read sql in jupyter
Como referencia para la lectura de sql en jupyter se utilizo como referencia:
https://towardsdatascience.com/heres-how-to-run-sql-in-jupyter-notebooks-f26eb90f3259
