
-- SAMPLE INSERT STATEMENTS

-- BREAD TYPES
INSERT INTO bread (code, name) VALUES
(1, 'Sourdough'),
(2, 'Whole Wheat'),
(3, 'Baguette');

-- CLIENTS
INSERT INTO client (client_id, name, phone, delivery) VALUES
(1, 'Alice Bakery', 5061112222, TRUE),
(2, 'Bob''s Cafe', 5063334444, FALSE),
(3, 'Charlie''s Market', 5065556666, TRUE);

-- BREAD RECIPES
INSERT INTO bread_recipe (id_recipe, id_bread) VALUES
(101, 1),
(102, 2),
(103, 3);

-- PRICES
INSERT INTO price (id_bread, regular_price, contract_price, special_price) VALUES
(1, 4.00, 3.50, NULL),
(2, 3.00, 2.50, 2.25),
(3, 2.50, 2.00, NULL);

-- DAILY STORE NUMBERS (how much bread is made per day)
INSERT INTO daily_store_number (id_bread, monday, tuesday, wednesday, thursday, friday, saturday, sunday) VALUES
(1, 10, 12, 11, 10, 15, 20, 18),
(2, 8, 9, 10, 8, 12, 18, 15),
(3, 6, 5, 5, 7, 10, 12, 10);

-- DAILY CLIENTS NUMBERS (how much each client orders of each bread)
INSERT INTO daily_clients_number (id_bread, client_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) VALUES
(1, 1, 2, 2, 3, 2, 4, 5, 4),
(2, 1, 1, 1, 1, 1, 2, 3, 2),
(3, 1, 0, 1, 1, 0, 1, 2, 1),
(1, 2, 1, 1, 1, 1, 1, 1, 1),
(2, 3, 2, 2, 2, 2, 2, 2, 2);
