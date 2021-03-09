# PC Information Database

Resources for building the PC Information Database from pages 53-54 of *A First Course in Database Systems*<sup>[1](#citation)</sup> using a Python script.
The tables in the book have been read into `csv` files, which are then imported into a MySQL server using the included Python script.

The script requires a connection to a running MySQL server to function. This connection is passed to the script as a MySQL connection object, defined in `connection.py`, an example of which is provided in this repository. The syntax is as follows:

```
"connection.py"

from mysql.connector import connection

conn = connection.MySQLConnection(
    host = "<MySQL host>",
    user = "<user>",
    password = "<server password>"
)
```

A MySQL export file is also included.

<a name="citation">[1]</a>: Ullman, Jeffrey D., and Jennifer Widom. *A First Course in Database Systems*. Third Edition ed., Pearson Education, Inc., 2008. 
