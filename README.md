# 📱 AppHub - Oracle SQL Database Project

**AppHub** is a relational database project that simulates the backend structure of a modern **App Store platform** like Google Play Store. It captures real-world entities and relationships such as users, apps, developers, downloads, reviews, categories, permissions, and app versions.

This project is built using **Oracle SQL** and includes well-normalized schemas, realistic sample data, and complex queries replicating actual store analytics.

---

## 📌 Key Features

- Fully normalized relational schema
- Realistic test data across all tables
- 30+ SQL queries replicating Play Store features:
  - Trending apps
  - Average app ratings
  - Top downloaded categories
  - User wishlists and activity
  - Permission analysis
  - Latest version tracking
- Use of joins, aggregations, date filtering, subqueries, and sorting
- Strict enforcement of integrity through foreign keys and constraints

---

## 🗃️ Database Tables

| Table Name         | Description                                      |
|--------------------|--------------------------------------------------|
| `USERS`            | App users and their profiles                     |
| `DEVELOPER`        | Developers or companies that create apps         |
| `APP`              | Core app details and references to developer     |
| `APP_VERSION`      | Tracks version history and updates per app       |
| `CATEGORY`         | Master list of app categories                    |
| `APP_CATEGORY`     | Maps apps to multiple categories                 |
| `PERMISSION`       | Master list of app permissions                   |
| `APP_PERMISSION`   | Permissions required by each app                 |
| `DOWNLOAD`         | Tracks app downloads by users                    |
| `REVIEW`           | Ratings and reviews submitted by users           |
| `WISHLIST`         | User wishlists of apps they're interested in     |

---

## 📊 Sample Queries

- 🔥 Top 5 Trending Apps (last 90 days)
- 🌟 Average rating of each app
- 🎮 Most popular app categories
- 🔐 Most frequently used permissions
- 📥 Downloads per app
- 📌 Apps in a specific category (e.g., Education)
- 📈 Version update history of an app
- 🧑‍💻 Active users by download count
- 📜 Reviews by app or user
- 🎯 Wishlist data analysis

---

## 🛠️ How to Run

1. Use **Oracle SQL** or [Oracle Live SQL](https://livesql.oracle.com/).
2. Execute `CREATE TABLE` scripts to set up the schema.
3. Insert the provided sample data (`INSERT INTO`).
4. Run any query script (`SELECT`) to view reports and analytics.
Note : Oracle live sql cannot run complex queries.
---
