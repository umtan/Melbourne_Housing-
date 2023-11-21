-----To see the columns of this database of Melbourne_housing
select * from PortFolio..Data$_xlnm#_FilterDatabase as mndt
------the above query retrived 3000 rows
select Suburb,Price,Distance,Postcode,Bedroom2,Car,Landsize,Lattitude,Longtitude  from PortFolio..Data$_xlnm#_FilterDatabase 
----------the above query retrived some of the selected columns 3000 rows
select  Suburb, SUM(Price) as Total  from PortFolio..Data$_xlnm#_FilterDatabase
group by  Suburb
--the above query retrived the total price of each suburb....it has 276 rows or suburb 

select Sum(price) as Total from PortFolio..Data$_xlnm#_FilterDatabase
-----the above query retrived the total price of all suburb. the result is 3217229827

---the query below shows the number of houses sold, in each Suburb
SELECT Suburb, COUNT(*) AS House_count,SUM(Price) as Total, Max(Price) as Highest_price, Min(Price) as Minimum_price
FROM PortFolio..Data$_xlnm#_FilterDatabase
GROUP BY Suburb;

----Finding number of bedroom/s of a house sold for  maximum  prices of each Suburb(Column 'Bedroom2')
----Just having a idea how many bedrooms have for maximun Price of any Suburb

SELECT h.Suburb, h.Bedroom2, h.Price
FROM PortFolio..Data$_xlnm#_FilterDatabase h
INNER JOIN (
    SELECT Suburb, MAX(Price) AS MaxPrice
    FROM PortFolio..Data$_xlnm#_FilterDatabase
    GROUP BY Suburb
) max_prices
ON h.Suburb = max_prices.Suburb AND h.Price = max_prices.MaxPrice;

----Finding number of bedroom/s of a house sold for  Minimum  prices of each Suburb(Column 'Bedroom2')
----Just having a idea how many bedrooms have for Minimun Price of any Suburb
SELECT h.Suburb, h.Bedroom2, h.Price
FROM PortFolio..Data$_xlnm#_FilterDatabase h
INNER JOIN (
    SELECT Suburb, Min(Price) AS MinPrice
    FROM PortFolio..Data$_xlnm#_FilterDatabase
    GROUP BY Suburb
) min_prices
ON h.Suburb = min_prices.Suburb AND h.Price = min_prices.MinPrice;

---Finding the highest price of all with LandSize and Bedrooms
SELECT Suburb, Bedroom2, Price, Landsize
FROM PortFolio..Data$_xlnm#_FilterDatabase
WHERE Price = (
    SELECT MAX(Price)
    FROM PortFolio..Data$_xlnm#_FilterDatabase);
------ the result shows : Suburb	   Bedroom2	      Price	      Landsize
-------------------------Canterbury	      5	          8000000	        2079
 