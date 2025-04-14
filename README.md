# 🍞 Bakery Database Project

This is a relational database project for managing a fictional bakery's operations. It was created as part of the final assignment for Codecademy's SQL curriculum. The database handles bread production, client management, pricing, recipes, and daily order tracking.

---

## 📘 Project Overview

The bakery database is designed to:
- Track types of bread produced
- Manage client information and delivery preferences
- Store bread recipe references
- Define pricing tiers (regular, contract, special)
- Monitor daily production by the store
- Log daily bread orders by each client

---

## 🗂️ Database Schema

The database is normalized (3NF) and uses:
- `PRIMARY KEY` / `FOREIGN KEY` constraints
- Default values
- Composite keys
- Refactoring to avoid redundancy

**Tables Included:**
- `bread`
- `client`
- `bread_recipe`
- `price`
- `daily_store_number`
- `daily_clients_number`

📄 See the schema in [`bakery_schema.sql`](./bakery_schema.sql)  
📊 You can also view or edit the schema using [`bakery_schema.dbml`](./bakery_schema.dbml)

---

## 🚀 How to Set Up

1. **Create a PostgreSQL database** (e.g. `bakerydb`)
2. **Run the schema SQL file:**
   ```bash
   psql -U postgres -d bakerydb -f bakery_schema.sql
3. **Insert sample data:**

   ```bash
   psql -U postgres -d bakerydb -f bakery_sample_data.sql
   ```
4. **Try example queries:**

```bash
psql -U postgres -d bakerydb -f bakery_queries.sql
```
You can also run individual queries using tools like Postbird or pgAdmin.

🔍 Sample Queries
Here are a few examples from bakery_queries.sql:

sql
Copiar
Editar
-- Weekly bread production totals
SELECT b.name, 
       (ds.monday + ds.tuesday + ds.wednesday + ds.thursday + ds.friday + ds.saturday + ds.sunday) AS total_production
FROM bread b
JOIN daily_store_number ds ON b.code = ds.id_bread;

-- Most ordered breads per client
SELECT c.name AS client, b.name AS bread,
       (dc.monday + dc.tuesday + dc.wednesday + dc.thursday + dc.friday + dc.saturday + dc.sunday) AS total_ordered
FROM daily_clients_number dc
JOIN client c ON dc.client_id = c.client_id
JOIN bread b ON dc.id_bread = b.code
ORDER BY total_ordered DESC;
🧱 ERD Diagram
You can view or edit the ERD on dbdiagram.io using this file:

bakery_schema.dbml

You can also export a .png or .pdf version of the ERD directly from the site.

📄 License
This project is for educational and portfolio use. You are free to fork, clone, and modify for non-commercial purposes.

🙌 Acknowledgments
Thanks to Codecademy’s CS103 - Databases course and the dbdiagram.io tool for helping structure and visualize this project.
