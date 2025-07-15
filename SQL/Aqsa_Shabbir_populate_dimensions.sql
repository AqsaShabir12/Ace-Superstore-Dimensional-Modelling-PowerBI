copy DimProduct
from 'A:\RDAMP\Task 1\DimProduct.csv' 
delimiter ','
csv header;

select * from DimProduct;

copy DimOrder
from 'A:\RDAMP\Task 1\DimOrder.csv' 
delimiter ','
csv header;

select * from DimOrder;
