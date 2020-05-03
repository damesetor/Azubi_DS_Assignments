--5
--net deposit
select count(distinct agent_id) 
from (select agent_id, sum(amount) from agent_transactions at2 
	where date_part('week', when_created) = date_part('week', current_date) - 1 /*dynamic week part for "last week"*/
group by agent_id 
having sum(amount) > 0) as sub; /*subquery returning sum of last week txns with net total >0 */