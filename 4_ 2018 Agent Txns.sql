--4
select date_part('year', when_created) as txn_year,
	   date_part('month', when_created) as txn_month,
	   count(atx_id) as sum_of_transactions
from agent_transactions at2 where date_part('year', when_created) = 2018
group by date_part('year', when_created),
	     date_part('month', when_created);