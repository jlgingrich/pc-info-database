from mysql.connector import connection

conn = connection.MySQLConnection(
    host = "localhost",
    user = "root",
    password = "testSQLpass250"
)