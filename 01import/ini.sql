DROP TABLE IF EXISTS catalog;

create table catalog (
    id varchar(32) primary key,
    name varchar(64),
    type varchar(64)
);

DROP TABLE IF EXISTS test_projects;

create table test_projects(
    project_id varchar(32) primary key,
    name varchar(64),
    goal_date datetime,
    user_id varchar(32),
    project_category_id varchar(32),
    total decimal(10,2)
);


DROP TABLE IF EXISTS test_rules;

create table test_rules(
    rule_id varchar(32) primary key,
    project_id varchar(32),
    rule_type_id varchar(32),
    amount decimal(10,2),
    frecuency int,    
    categories varchar(64)        
);

DROP TABLE IF EXISTS test_transactions;

create table test_transactions(
    user_id varchar(32) primary key,
    description varchar(64),
    transaction_date datetime,
    amount decimal(10,2)    
);


