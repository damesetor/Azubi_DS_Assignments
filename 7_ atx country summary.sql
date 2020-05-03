--7

create table atx_volume_country_summary as 
select a2.country,
	   a2.city,
	   sum(abs(at2.amount)) as total_volumes  
from agent_transactions at2 join agents a2 on at2.agent_id = a2.agent_id 
where date_part('week', at2.when_created) = date_part('week', current_date) - 1
group by a2.country, a2.city;