---
topic: "JDBC"
desc: "Java Database Connectivity--a way to use SQL-based databases with Java"
---

To use a database from a Java program, you'll need to do (at least) these things:

1. Identify a database host that you can connect to
1. Set up your database tables in that database
1. Set up your Java code to access that database

# Identifying a database host that you can connect to

The easiest way, by far, to get started with using a SQL database is to use one called `sqlite3`.

The `sqlite3` command is available on CSIL machines:

```
-bash-4.3$ sqlite3
SQLite version 3.11.0 2016-02-15 17:29:24
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> 
```

Using `sqlite3` has certain disadvantages, as you'll discover.   

# Pros/cons of sqlite3 vs. other options

The main "pro" of sqlite3 is that it is easy to set up:

* It is "serverless".  Meaning that to use it, you either
    * Use the command line tool sqlite3
    * Access the database through some sqlite API, e.g. the JDBC API for Java
* It is already installed on CSIL
* It is relatively easy to install on Mac, Windows, Linux

Some disadvantages:

From <http://talks.php.net/show/sqlite_jan/4>:

>    * It's Slow
>        * Locks whole file for writing.
>        * No caching mechanism of it's own.
>    * Limited
>        * Database size restricted to 2GB in most cases.
>        * Not fully SQL92 compliant.
>        * Not very scalable.

But, for small applications in CMPSC56, it is likely that none of those things will matter.

Here are some links to other discussions of pros/cons of sqlite:

* <https://www.sqlite.org/different.html>
* <https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems>
* <https://www.sqlite.org/whentouse.html>


# Resources

* [Oracle's JDBC Tutorial](https://docs.oracle.com/javase/tutorial/jdbc/)
* [Tutorialspoint JDBC+Sqlite3 Tutorial](http://www.tutorialspoint.com/sqlite/sqlite_java.htm)
* [Sqlite3 Shell Commands](https://www.sitepoint.com/getting-started-sqlite3-basic-commands/)

----

<div style="display:none;">
https://ucsb-cs56-pconrad.github.io/topics/jdbc/
</div>
