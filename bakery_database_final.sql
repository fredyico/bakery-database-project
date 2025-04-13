
-- BAKERY DATABASE SCHEMA AND IMPLEMENTATION

-- 1. TABLE CREATION (SCHEMA)
CREATE TABLE bread (
    code INTEGER PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE client (
    client_id INTEGER PRIMARY KEY,
    name VARCHAR,
    phone INTEGER,
    delivery BOOLEAN
);

CREATE TABLE bread_recipe (
    id_recipe INTEGER PRIMARY KEY,
    id_bread INTEGER NOT NULL REFERENCES bread(code)
);

CREATE TABLE price (
    id_bread INTEGER PRIMARY KEY REFERENCES bread(code),
    regular_price FLOAT,
    contract_price FLOAT,
    special_price FLOAT DEFAULT NULL
);

CREATE TABLE daily_store_number (
    id_bread INTEGER PRIMARY KEY NOT NULL REFERENCES bread(code),
    monday INTEGER DEFAULT 0,
    tuesday INTEGER DEFAULT 0,
    wednesday INTEGER DEFAULT 0,
    thursday INTEGER DEFAULT 0,
    friday INTEGER DEFAULT 0,
    saturday INTEGER DEFAULT 0,
    sunday INTEGER DEFAULT 0
);

CREATE TABLE daily_clients_number (
    id_bread INTEGER NOT NULL REFERENCES bread(code),
    client_id INTEGER NOT NULL REFERENCES client(client_id) ON DELETE CASCADE,
    monday INTEGER DEFAULT 0,
    tuesday INTEGER DEFAULT 0,
    wednesday INTEGER DEFAULT 0,
    thursday INTEGER DEFAULT 0,
    friday INTEGER DEFAULT 0,
    saturday INTEGER DEFAULT 0,
    sunday INTEGER DEFAULT 0,
    PRIMARY KEY (id_bread, client_id)
);

-- 2. INDEXES (OPTIMIZATION)
CREATE INDEX idx_client_phone ON client(phone);
CREATE INDEX idx_bread_name ON bread(name);
CREATE INDEX idx_daily_clients_composite ON daily_clients_number(id_bread, client_id);

-- 3. USER PERMISSIONS (PROTECTION)
-- (Note: Adjust schema/user settings to match your environment)
-- CREATE USER bakery_staff WITH PASSWORD 'securePassword123';
-- GRANT SELECT, INSERT ON bread, client, daily_clients_number TO bakery_staff;
-- REVOKE DELETE ON ALL TABLES IN SCHEMA public FROM bakery_staff;

-- 4. SAMPLE QUERY (OPTIMIZED)
-- Total orders by bread name for the week
-- SELECT b.name, SUM(dc.monday + dc.tuesday + dc.wednesday + dc.thursday + dc.friday + dc.saturday + dc.sunday) AS total_orders
-- FROM bread b
-- JOIN daily_clients_number dc ON b.code = dc.id_bread
-- GROUP BY b.name
-- ORDER BY total_orders DESC;

-- 5. MAINTENANCE EXAMPLES
-- UPDATE client SET phone = 5061234567 WHERE client_id = 4;
-- DELETE FROM client WHERE client_id = 10; -- cascades on daily_clients_number

-- Backup Suggestion: Use pg_dump regularly for backups
-- VACUUM ANALYZE should be scheduled weekly
