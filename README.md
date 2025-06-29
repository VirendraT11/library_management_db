# 📚 Library Management Database (DBMS Mini Project)

This project is a **Database-Only Library Management System** designed using **SQL**. It simulates a real-world library system, showcasing strong skills in **relational database design**, **query writing**, and **data integrity enforcement**.

> 🔗 GitHub Repository: [VirendraT11/library_management_db](https://github.com/VirendraT11/library_management_db)

---

## 🛠 Tech Stack

- **Database:** MySQL / SQL (RDBMS concepts)
- **Query Language:** Structured Query Language (SQL)
- **Tools Used:** MySQL Workbench / phpMyAdmin / CLI-based MySQL
- **Data Modeling:** ER Diagram, Normalization, Foreign Key Relationships

---

## 🧱 Database Structure

The project contains DDL (Data Definition Language) and DML (Data Manipulation Language) scripts to create and manage the following tables:

- `Books` 📖 — stores details of books (ISBN, title, author, category)
- `Members` 🧑 — stores details of library members (ID, name, contact)
- `IssueRecords` 🗂 — tracks which book is issued to which member and when
- `Staff` 👨‍💼 — optional table for librarian/staff data
- `Returns` 🔁 — tracks return status, fine (if any)

ER diagram and foreign key relationships ensure **data consistency** and **referential integrity**.

---

## ✨ Key Features

- 🔍 **Search Functionality:** Retrieve book/member records by ID, name, or category
- 📥 **Issue Books:** Record issue dates and expected return dates
- 🔁 **Return Books:** Track actual return dates and calculate fines if late
- 📊 **Reports:** Generate lists of issued books, overdue returns, and active members
- 🛡️ **Data Integrity:** Enforced with PRIMARY, FOREIGN keys, and constraints
- 🧹 **Normalized Design:** Ensures efficient storage and minimal redundancy

---

## 📂 Project Structure

```

library\_management\_db/
├── create\_tables.sql         # DDL scripts to create database & tables
├── insert\_data.sql           # Sample data population scripts
├── queries.sql               # DML queries (search, issue, return, reports)
├── ER\_Diagram.png            # Visual representation of schema (if included)
└── README.md                 # Project documentation

````

---

## 🚀 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/VirendraT11/library_management_db
   cd library_management_db

2. Open your MySQL client or Workbench

3. Run the scripts in this order:

   * `create_tables.sql` ✅
   * `insert_data.sql` 📥
   * `queries.sql` 🔍 (for testing/report generation)

---

## 🧠 Concepts Practiced

* ✅ Relational DBMS Design
* 🔑 Primary & Foreign Keys
* 📈 Data Queries & Aggregation
* 🚫 Constraints and Validation

---

## 🙋‍♂️ Author

**Virendra Tambavekar**
📌 LinkedIn: [linkedin.com/in/virendra-tambavekar](https://www.linkedin.com/in/virendra-tambavekar/)
🐦 Twitter: [@VirendraCodes](https://x.com/VirendraCodes)

---

## 🪄 Future Enhancements

* 📋 Admin panel for librarian controls
* 📧 Email alerts for overdue books
* 📊 Exportable reports (CSV, PDF)

---

## ⭐ Show Some Love

If you liked the project, consider giving it a ⭐ on GitHub and sharing it with your peers!

> “Built with SQL and a passion for clean data design. 🧠💾”


