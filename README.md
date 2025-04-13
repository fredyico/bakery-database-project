
# 🍞 Bakery Database Project

This is a relational database project designed for a fictional bakery business. It manages daily bread production, client orders, pricing structures, and recipes. The project was built as part of the final assignment for Codecademy's SQL and Databases curriculum.

---

## 📘 Project Overview

The database includes:
- A catalog of bread types
- A list of clients and their delivery preferences
- Daily production tracking for each bread type
- Client-specific daily ordering
- Recipes per bread
- Tiered pricing for each bread (regular, contract, and special)

---

## 🗂️ Schema Structure

**Tables:**
- `bread`: Bread catalog
- `client`: Business clients
- `bread_recipe`: Links bread to recipe ID
- `price`: Holds regular, contract, and special pricing
- `daily_store_number`: Weekly bread production per type
- `daily_clients_number`: Weekly bread orders per client per type

The database is normalized up to 3NF and uses appropriate `PRIMARY KEY`, `FOREIGN KEY`, and `DEFAULT` constraints.

---

## ⚙️ Technologies Used

- PostgreSQL
- SQL
- dbdiagram.io (ERD Design)
- psql (Command-line PostgreSQL tool)
- Postbird (PostgreSQL GUI)

---

## 🚀 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/bakery-database-project.git
   ```

2. Create a new database (e.g., `bakerydb`)

3. Run the schema:
   ```bash
   psql -U postgres -d bakerydb -f bakery_schema.sql
   ```

4. Insert sample data:
   ```bash
   psql -U postgres -d bakerydb -f bakery_sample_data.sql
   ```

5. Optionally, run example queries from `bakery_queries.sql`

---

## 🔍 Sample Queries

```sql
-- Total weekly bread production
SELECT b.name, (ds.monday + ds.tuesday + ds.wednesday + ds.thursday + ds.friday + ds.saturday + ds.sunday) AS total
FROM bread b
JOIN daily_store_number ds ON b.code = ds.id_bread;

-- Clients with highest orders
SELECT c.name AS client, b.name AS bread,
       (dc.monday + dc.tuesday + dc.wednesday + dc.thursday + dc.friday + dc.saturday + dc.sunday) AS total_ordered
FROM daily_clients_number dc
JOIN client c ON dc.client_id = c.client_id
JOIN bread b ON dc.id_bread = b.code
ORDER BY total_ordered DESC;
```

---

## 📈 ERD

Included in both `.dbml` (editable) and `.png` (image) format.

---

## 📄 License

This project is for educational and portfolio use.
