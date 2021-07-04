#sudo apt-get install libmysqlclient-dev
#pip3 install mysqlclient
#pip3 install sqlalchemy
#pip3 install pandas

from datetime import datetime
import pandas as pd
from sqlalchemy import create_engine
from decimal import Decimal
from sqlalchemy.sql.sqltypes import DECIMAL
from sqlalchemy.types import Integer, VARCHAR, DATETIME, INTEGER, SMALLINT

if __name__ == "__main__":
    cs = "mysql://dbadmin:IEBKdKOR9cB79bUH@mydbinstance1.cqornbg3nzt3.us-east-1.rds.amazonaws.com/mydb"

    catalog = pd.read_csv('./../data/catalog.csv', dtype={'id': str, 'name': str, 'type': str}, index_col='id')
    test_projects = pd.read_csv('./../data/test_projects.csv', 
        dtype={
            'project_id': str, 
            'name': str, 
            'goal_date': object, 
            'user_id': str, 
            'project_category_id':str }, converters={'total': Decimal }, index_col='project_id', parse_dates=['goal_date'])      
    
    test_rules = pd.read_csv('./../data/test_rules.csv', 
        dtype={'rule_id': str, 
               'project_id': str, 
               'rule_type_id': str,               
               'frecuency': int,
               'categories': str}, index_col='rule_id', converters={'amount': Decimal })                   

    test_transactions = pd.read_csv('./../data/test_transactions.csv', 
        dtype={'user_id': str, 'description': str, 'transaction_date': object},
        parse_dates=['transaction_date'],        
        converters={'amount': Decimal })

    engine = create_engine(cs)     
    
    catalog.to_sql(con=engine, name='catalog',if_exists='replace', 
        dtype={'id': VARCHAR(32), 'name': VARCHAR(64), 'type': VARCHAR(64)})

    test_projects.to_sql(con=engine, name='test_projects', if_exists='replace',
         dtype={'project_id': VARCHAR(32), 'name': VARCHAR(64), 'goal_date': DATETIME, 
                'user_id': VARCHAR(32), 
                'project_category_id': VARCHAR(32), 'total': DECIMAL(10,2) })
    
    test_rules.to_sql(con=engine, name='test_rules', if_exists='replace',
         dtype={'rule_id': VARCHAR(32), 'project_id': VARCHAR(32), 'rule_type_id': VARCHAR(32), 
                'categories': VARCHAR(64), 'goal_date': DATETIME, 
                'user_id': VARCHAR(32), 
                'project_category_id': VARCHAR(32), 'amount': DECIMAL(10,2), 'frecuency': SMALLINT })
     
    test_transactions.to_sql(con=engine, name='test_transactions', if_exists='replace',
         dtype={'user_id': VARCHAR(32),
                'description': VARCHAR(64), 
                'transaction_date': DATETIME,                 
                'amount': DECIMAL(10,2) }, index=False)

    engine.dispose()
    

