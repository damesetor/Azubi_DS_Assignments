--8
	
create table send_volume_by_country_and_kind as
select w2.ledger_location as country,
	   t.kind as transfer_kind,
	   sum(abs(t.send_amount_scalar)) as volume
from transfers t join wallets w2 on t.source_wallet_id = w2.wallet_id
where date_part('week', t.when_created) = date_part('week', current_date) - 1
group by w2.ledger_location,
	   	 t.kind;