  
select tp.project_id, tp.name, cp.name as 'project_category', tp.total, t.*
from 
    test_projects tp join 
    catalog cp on cp.id = tp.project_category_id join
    test_transactions t on t.user_id = tp.user_id
where cp.type = 'project_categories' 
order by project_id
limit 10

select * from  test_transactions limit 10

SHOW PROCESSLIST;

ALTER TABLE test_transactions ADD PRIMARY KEY(user_id, transaction_date);



select cr.name as 'rule_type', tr.amount , tr.frecuency,  tp.project_id, tp.name, cp.name as 'project_category', tp.total
from 
    test_projects tp join catalog cp on cp.id = tp.project_category_id 
    join test_rules tr on tr.project_id = tp.project_id 
    join catalog cr on cr.id = tr.rule_type_id 
where tr.project_id = '0d0849af491841f5bd932d718ae949b0'
LIMIT 10;


select cr.name as 'rule_type', tp.project_id, tp.name, cp.name as 'project_category', tp.total, tt.description, tt.transaction_date , tt.amount 
from 
    test_projects tp join catalog cp on cp.id = tp.project_category_id 
    join test_rules tr on tr.project_id = tp.project_id 
    join catalog cr on cr.id = tr.rule_type_id 
    join test_transactions tt on tt.user_id = tp.user_id 
where tt.user_id = '0a10418402d54ce78d3b544657640997' 
order by tt.transaction_date 



select tp.project_id, tp.name, cp.name as 'project_category', tp.goal_date , tp.total, tt.description, tt.transaction_date , tt.amount 
from 
    test_projects tp join catalog cp on cp.id = tp.project_category_id         
    join test_transactions tt on tt.user_id = tp.user_id 
where tt.user_id = '0a10418402d54ce78d3b544657640997' 
order by tt.transaction_date 

select DISTINCT goal_date from test_projects

goal , result  =>  result (fecha goal) - goal = status -200 0 +100  #projectos < 0 $ projectos >=0     ......::::::::::::::: | percentaje que pudo cumplir  coloreado por tipo projecto
			   =>

# tipo project viajar -> histograma rules (  )

// 1 test_projects -> N test_transactions
// 1 test_projects -> N test_rules

// project meta (Viajar) necesito 4000 tengo varios rules (Rodondear), 


 and cr.id = 'rule_types'
 
 select  *  from test_rules tr where project_id = '0d0849af491841f5bd932d718ae949b0'
 
  select DISTINCT  from test_rules tr 
  
 select DISTINCT amount from test_transactions tt  
 
 
 
2eb9f42a930a4cccad68e63277894f2d
b546e16f09784337951be3c12e331a07