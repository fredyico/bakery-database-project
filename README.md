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
