select
	100.00 * sum(cast(case
		when p_type like 'PROMO%'
			then l_extendedprice * (1 - l_discount)
		else 0
	end as number)) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from
	lineitem,
	part
where
	l_partkey = p_partkey
	and l_shipdate >= cast('1994-03-01' as datetime)
	and l_shipdate < cast('1994-04-01' as datetime); -- modified not to include cast({'month': 1} as interval)
