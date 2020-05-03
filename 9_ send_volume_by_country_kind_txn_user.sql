--9

create table send_volume_by_country_kind_txn_user as
select w2.ledger_location as country,
	   t.kind as transfer_kind,
	   sum(abs(t.send_amount_scalar)) as volume,
	   count(t.transfer_id) as transaction_count,
	   count(distinct t.u_id ) as no_of_unique_senders
from transfers t join wallets w2 on t.source_wallet_id = w2.wallet_id
where date_part('week', t.when_created) = date_part('week', current_date) - 1
group by w2.ledger_location,
	   	 t.kind;