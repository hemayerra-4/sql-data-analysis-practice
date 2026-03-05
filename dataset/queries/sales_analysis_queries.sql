Total Boxes Sold
SELECT SUM(boxes) AS total_boxes
FROM sales;

Total Sales by Salesperson
SELECT p.salesperson, SUM(s.boxes) AS total_boxes
FROM sales s
JOIN people p
ON s.spid = p.spid
GROUP BY p.salesperson;

Sales in 2022
SELECT *
FROM sales
WHERE YEAR(saleDate) = 2022;

Top 5 Salespersons
SELECT p.salesperson, SUM(s.boxes) AS total_boxes
FROM sales s
JOIN people p
ON s.spid = p.spid
GROUP BY p.salesperson
ORDER BY total_boxes DESC
LIMIT 5;

Bottom 3 Salespersons
SELECT p.salesperson, SUM(s.boxes) AS total_boxes
FROM sales s
JOIN people p
ON s.spid = p.spid
GROUP BY p.salesperson
ORDER BY total_boxes ASC
LIMIT 3;
