--10

select t.source_wallet_id,
	   sum(abs(t.send_amount_scalar)) as transfer_amount
from transfers t
where t.send_amount_currency = 'CFA' and 
	date_part('month', t.when_created) = date_part('month', current_date) - 1 /*dynamic months part for "last month"*/
group by t.source_wallet_id 
having sum(abs(t.send_amount_scalar)) > 10000000
order by source_wallet_id asc	