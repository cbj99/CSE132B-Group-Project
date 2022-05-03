# How to run 
1. install postregsql 
2. run createAllTable.sql in postregsql
3. Create a Dynamic Web Project from Eclipse IDE
4. import postreg connection jar into WEB-INF
5. import all jsp files into appropriate directory(under same direcoty as META-INF WEB-INF)
6. replace all authentication connection(Username, Password) inside all jsp files with a string that runs on local machine. 
7. Example data are in insertAllTable.sql. Run this file to get some data inside tables
8. To Drop all Tables, run dropAllTable.sql
9. To flush all tables, run deleteAllContent.sql