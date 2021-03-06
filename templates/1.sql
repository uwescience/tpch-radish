lineitem = scan('lineitem');

q1 = select l_returnflag, 
       l_linestatus, 
       sum(l_quantity) as sum_qty,
       sum(l_extendedprice) as sum_base_price,
       sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
       sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
       FLOAT(sum(l_quantity))/count(l_quantity) as avg_qty, -- avg
       FLOAT(sum(l_extendedprice))/count(l_extendedprice) as avg_price, -- avg
       FLOAT(sum(l_discount))/count(l_discount) as avg_qty, -- avg
       count(l_quantity) as count_order  -- really COUNT(*)
from
       lineitem
where 
  l_shipdate <= "1998-09-01";       -- TODO fill in delta automatically; validation is 90 days delta
--auto group by l_returnflag, l_linestatus 

-- TODO
-- order by l_returnflag, l_linestatus

store(q1, q1);
