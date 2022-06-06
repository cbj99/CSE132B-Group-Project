# How to run our code
1. Install postregsql.
2. Run `createAllTable.sql` using postregsql's query tool.
3. Create a Dynamic Web Project using Eclipse IDE.
4. Import PostgreSQL connection jar into `WEB-INF`.
5. Use all jsp files in the `Entry Form` folder to create the Entry Form: used to insert, update, delete data in your local database (Milestone 2).
6. Use all jsp files in the `Query Form` folder to create the Query Form: used to generate useful reports (Milestone 3).
7. All sql files in the `Query` folder are used to implement corresponding jsp files in the `Query Form` folder.
8. Import all jsp files into appropriate directory(under same direcoty as `META-INF`, `WEB-INF`). Notice that "Entry Form" and "Query Form" are using different `menu.html`.
9. Replace all authentication `connection(Username, Password)` inside all jsp files with a string that runs on local machine. 
10. To build the constraints mentioned in the requirement of Milestone 4 using triggers, run all `.sql` files in the `triggers` folder using postregsql's query tool.
11. To simulate the "materialized view" : `cpqg` and `cpg` mentioned in the requirement of Milestone 5 using triggers, run all `xxx_maintenance.sql` files in the `materialized_views` folder using postregsql's query tool. Notice that tables `cpqg` and `cpg` are already implemented in step 2.
12. Example data are in `insertAllTable_required.sql`. Run this file to get some data inside tables using postregsql's query tool.
13. To Drop all Tables, run `dropAllTable.sql` using postregsql's query tool.
14. To flush all tables, run `deleteAllContent.sql` using postregsql's query tool.