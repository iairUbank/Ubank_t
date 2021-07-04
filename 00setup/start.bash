aws configure set region us-east-1
aws configure set access_key
aws configure set secret_key 

aws cloudformation delete-stack --stack-name myteststack1
aws cloudformation create-stack --stack-name myteststack1 --template-body file://mysql.json --parameters ParameterKey=DBUsername,ParameterValue=dbadmin ParameterKey=DBInstanceID,ParameterValue=mydbinstance1 ParameterKey=DBPassword,ParameterValue=IEBKdKOR9cB79bUH
aws cloudformation list-stacks
