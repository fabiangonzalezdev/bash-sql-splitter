# Bash-SQL Splitter and Importer

This repository contains a bash script to split large SQL dump files into smaller parts and a secondary script to automate the import of these parts into a new server using phpMyAdmin or BigDump.

## Features

- Split large SQL files into smaller parts for easier upload.
- Automatically import SQL parts using BigDump.

## Prerequisites

- Access to the server where the SQL dump will be imported.
- `bigdump.php` script (included in this repository).
REMEMBER add permissions to the bash files
```bash
chmod +x split_sql.sh
chmod +x execute_import.sh
```

## Usage Instructions

### 1. Exporting the Database

Before exporting your database for import on a new server, ensure the following options are set in phpMyAdmin or your MySQL export tool:

- **Character Set**: UTF-8 (or `utf8mb4` for full Unicode support).
- **Export**: Include the `CREATE TABLE` statements for each table.
- **Do Not**: Use extended inserts to avoid overly long SQL queries.

### 2. Preparing the SQL for Import

- Replace the database name in the SQL dump with your new database name. Specifically, replace `u359200504_F1Omh` with your desired database name.
- Be cautious when importing tables with specific prefixes like `wp_nombredetabla`. Ensure the prefix matches the existing tables if you're merging into an existing database.

### 3. Using BigDump for Import

You can use `bigdump.php` to import the split SQL files:

1. Upload the split SQL files and the `bigdump.php` script to the server.
2. Access the `bigdump.php` file via the browser and start the import.

### 4. Automating the Import

After splitting the SQL file, use the provided bash script to automate the import process:

```bash
bash execute_import.sh
```

Where yourdomain.com is your server’s domain, and part_X.sql is each part of the split SQL file.

Notes

	•	Be sure to adjust the DATABASE_NAME and TABLE_PREFIX variables in your SQL files before importing.
	•	The bash script execute_import.sh will wait for 2 minutes between each part import to avoid server overload.

License

This project is licensed under the MIT License.