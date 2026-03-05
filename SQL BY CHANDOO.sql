SELECT * FROM Sales;
SELECT SaleDate, Amount, Customers FROM Sales;
SELECT SaleDate, Amount, Boxes, Amount/Boxes FROM Sales;
SELECT SaleDate, Amount, Boxes, Amount/Boxes 'Amount per Box' FROM Sales;
SELECT * FROM sales where Amount>10000;
SELECT * FROM sales where Amount>10000
ORDER BY Amount asc;
SELECT * FROM sales where Amount>10000
ORDER BY Amount desc;

SELECT* FROM sales
WHERE Amount >10000 and SaleDate >='2022-01-01';

SELECT SaleDate, Amount from Sales
Where Amount> 10000 and year(SaleDate) = 2022
ORDER BY amount desc;

SELECT * FROM sales
where Boxes between  0 and 50
order by Boxes asc;

SELECT SaleDate, Amount, Boxes, weekday(saleDate) as 'Day of week'
fROM Sales
WHERE Weekday(SaleDate) =4;

SELECT* FRoM People;

select * from People
Where Team ='Yummies'or Team= 'Jucies';

SELECT * from people
Where team in ('yummies','jucies');

SELECT * FROM PEOPLE
WHERE SalesPerson like 'V%';
SELECT * FROM PEOPLE
WHERE SalesPerson like '%V';

SELECT * FROM Sales;

SELECT SaleDate, Amount,
 case	WHEN Amount<1000 then 'under 1k'
		When Amount <5000 then 'under 5k'
        When Amount <10000 then 'under 10k'
        else '10K or more'
        end as 'Amount Category'
        from sales;
       
       SELECT* FROM SALES;
       SELECT * FROM PEOPLE;
       
       SELECT s.saleDate, s.amount,p.salesperson, S.SPID,P.SPID
       FROM sales s JOIN People p on P.SPID= S.SPID;
       
       SELECT S.saleDate, S. amount,P.salesperson,S.SPID,P.SPID
       from sales s 
       join people p on p.SPID=S.SPID;
       
       select* from products;
       
       SELECT s.SaleDate, S.amount, p.Product, p.PID,S.PID
       FROM sales s LEFT join products p on s. PID = P.PID;
       
       SELECT S.saleDate, S. amount,P.salesperson,Pr.product, p. team
       from sales s 
       join people p on p.SPID=S.SPID
       join products pr on s. PID = Pr.PID;
       
        SELECT S.saleDate, S. amount,P.salesperson,Pr.product, p. team,
      Case 	when s.amount <1000 then 'under1k'
	    when s. amount <5000 then 'under5k'
        when s.amount <10000 then '10k'
        Else '10k or more than'
	end as 'Amount category'
    from sales s 
       join people p on p.SPID=S.SPID
       join products pr on s. PID = Pr.PID
       where s.amount <500 and p.team ='Delish';
       
       SELECT S.saleDate, S. amount,P.salesperson,Pr.product, p. team
       from sales s 
       join people p on p.SPID=S.SPID
       join products pr on s. PID = Pr.PID
       where s.amount <500 and p.team= ' ';
       
       SELECT S.saleDate, S. amount,P.salesperson,Pr.product, p. team, g.geo,
       Case 	when s.amount <1000 then 'under1k'
	    when s. amount <5000 then 'under5k'
        when s.amount <10000 then '10k'
        Else '10k or more than'
	end as 'Amount category'
    from sales s 
       join people p on p.SPID=S.SPID
       join products pr on s. PID = Pr.PID
       join geo g on g.GeoID = s.GeoID
       where s.amount >500 and p.Team is not null
       and g.Geo in ('New zealand' , 'India')
       order by s.SaleDate;

       
       select* from geo;
       
       SELECT geo, sum(amount), avg(amount),sum(Boxes)
       from sales s
       Join Geo g on s.GeoID= g.GeoID
       Group by g.geo;
       
       Select * from Sales;
       
       select pr.category, p.team, sum(Boxes), sum(amount)
       from sales s
       join people p on p.spid= s. spid
       Join products pr on pr.PID =s.PID
       group by pr.category, p.team;
       
       select pr.category, p.team, sum(Boxes), sum(amount)
       from sales s
       join people p on p.spid= s. spid
       Join products pr on pr.PID =s.PID
       group by pr.category, p.team
       order by sum(boxes) asc;
       
       select pr.category, p.team, sum(Boxes), sum(amount)
       from sales s
       join people p on p.spid= s. spid
       Join products pr on pr.PID =s.PID
       where p.team<>' ' is not null
       group by pr.category, p.team
       order by pr.category, p.team;
       
       select * from products;
       select* from people;
       
       select pr.Product, sum(s.amount) as total_amount
       from sales s 
       join products pr on pr.PID= s.PID
       Group by pr.product
       order by total_amount desc;
       
       select pr.Product, sum(s.amount) as total_amount
       from sales s 
       join products pr on pr.PID= s.PID
       Group by pr.product
       order by total_amount desc
       Limit 10;
        
       select* from geo;
       
       select * from sales where Amount > 2000 and Boxes <100;
       
       select p.salesperson, count(*) as shipment_count
       from sales s
       Join  people p on p.SPID = s.SPID
       where s. SaleDate between '2022-01-01' and '2022-01-31'
       group by p.Salesperson;
       
       Select p.salesperson, count(*) as shipment_count
         from sales s
       join people p on s.SPID = P.SPID
       where s.saleDate between '2022-01-01' and '2022-01-31'
       Group by p.salesperson;
       
       Select p.product,  sum(Boxes) as total_boxes
       from sales s
       join products p on S.PID=P.PID
       where p.product in ('Milk Bars','Eclairs')
       Group by p.product;
       
       Select p.Product, sum(boxes) as Total_sold
       from sales s
       join Products p on S.PID =P.PID
       where p.product in ('Milk Bars','Eclairs') 
       and s.SaleDate between '2022-02-01'and'2022-02-07'
       group by p.product;
       
       select * from sales
       where customers <100 and Boxes<100;
       
       select*,
       case when weekday(SaleDate) = 2 then 'Wednesday Shipment'
       else'other days'
	end as 'W Shipment'
        from sales
        where customers<100 and Boxes <100;
        
        select * from sales
        where Amount>1000 and Boxes<100;
        
        select p.Salesperson, count(*) as shipment_count
           from sales s
           join people p on s. spid = p. spid
           where s.SaleDate between '2022-01-01' and '2022-01-31'
           group by p.Salesperson;
           
        select pr.product, sum(boxes) as total_boxes
        from sales s
        join products pr on pr.PID= s. PID
        where pr.product in ('Milk Bars'and 'Eclairs') 
        and s.SaleDate between '2022-02-01' and '2022-02-07'
        group by pr.product;
        
        select * from sales
         where Customers<100 and boxes<100;
         
         select *,
            case when weekday(SaleDate)= 2 then 'Wednesday shipment'
           else "other days"
           end as 'W Shipment'
           from sales
           where customers<100 and boxes<100;
           
           select  p.salesperson
            from sales s
            join  people p on p.SPID= S.SPID
            where s.SaleDate between '2022-01-01' and '2022-01-07'
            group by p.salesperson;
           
            
            select p.salesperson
              from people p
              where p.spid not in( select s.spid 
              from sales s
             where s.saledate between '2022-01-01' and '2022-01-07');
             
       select * from sales
       limit 10;
       
       select p.salesperson, count(*) as total_sales
           from sales s
           join people p on p.spid=s.spid
           group by p.Salesperson;
           
           select p.salesperson, sum(Boxes) as total_boxes
              from sales s
              join people p on s.spid = p.spid
              group by p.salesperson;
              
              select p.salesperson, sum(Boxes) as total_boxes
                 from sales s 
                 join people p on s.spid =p.spid
                 where s.saleDate between '2022-01-01' and '2022-12-31'
                 group by p.Salesperson;
                 
                 select p.salesperson,sum( s. boxes) as total_boxes
                     from sales s
                     join people p on s.spid = p.SPID
                      where year(s.saleDate)='2022'
					group by p.salesperson
                    having sum(s.boxes) >30000 ;
                    
                    select p.salesperson, sum(s.boxes) as total_boxes
                      from sales s
                      join people p on s.spid = p.SPID
                      where year(s.saleDate)='2022'
                      group by p.Salesperson
                       having sum(s.boxes) >30000 ;
                       
                       select p.salesperson, sum(s.boxes) as total_boxes
                          from sales s
                          join people p on s.spid = p.SPID
                          where year(s.saleDate)='2022'
                          group by p.Salesperson
                          having sum(s.boxes)
                          order by s.boxes asc
                          limit 3,
                      
                 
     select p.salesperson, Sum(s.boxes) as Total_Boxes
             from sales s
             Join people p on p.spid= s.spid
             where year(s.saleDate)= '2022'
             Group by p.salesperson
             order by sum(s.boxes) asc
             limit 3;
             
             
             select p.salesperson, Sum(s.boxes) as Total_Boxes
               from sales s
               join people p on s.spid=p.spid
               where year(s.saleDate)= '2022'
               Group by p.salesperson
               order by sum(boxes) asc
               limit 3;
               
               
              
		
        
        