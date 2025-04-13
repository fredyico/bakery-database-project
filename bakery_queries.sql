
-- Weekly production per bread
SELECT b.name, 
       (ds.monday + ds.tuesday + ds.wednesday + ds.thursday + ds.friday + ds.saturday + ds.sunday) AS total_production
FROM bread b
JOIN daily_store_number ds ON b.code = ds.id_bread;

-- Weekly orders per client
SELECT c.name AS client, b.name AS bread,
       (dc.monday + dc.tuesday + dc.wednesday + dc.thursday + dc.friday + dc.saturday + dc.sunday) AS total_ordered
FROM daily_clients_number dc
JOIN client c ON dc.client_id = c.client_id
JOIN bread b ON dc.id_bread = b.code
ORDER BY total_ordered DESC;

-- Breads with special pricing
SELECT b.name, p.special_price
FROM bread b
JOIN price p ON b.code = p.id_bread
WHERE p.special_price IS NOT NULL;

-- Client delivery preferences
SELECT name, phone, delivery FROM client;

-- Bread production on weekends
SELECT b.name, ds.saturday, ds.sunday
FROM daily_store_number ds
JOIN bread b ON ds.id_bread = b.code
WHERE ds.saturday > 0 OR ds.sunday > 0;
