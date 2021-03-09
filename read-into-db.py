import mysql
import mysql.connector
import csv

# Utility for loading CSV files into a MySQL server

# FUNCTIONS
def try_types(a):
    '''Takes a string and tries to cast it to an SQL type'''
    b = None
    if a.lower() == "true":
        b = True
    elif a.lower() == "false":
        b = False
    else:
        try: b = int(a)
        except:
            try: b = float(a)
            except: b = str(a)
    return b

def insert_many(cur, table, args):
    '''Generates and executes an SQL command that inserts list <args> into the specified <table>'''
    varstring = ", ".join(("%s " * len(args)).split())
    statement = "INSERT INTO " + table + " VALUES (" + varstring +  ")"
    cur.execute(statement, args)

def load_csv(cur, file, table):
    '''Loads a csv <file> into a <table> while interpreting data types'''
    with open(file) as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            row = list(map(try_types, row))
            print(row)
            insert_many(cur, table, row)



# SCRIPT

# Open connection to server
conn = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "testSQLpass250" )
cur = conn.cursor()
cur.execute("USE pc_information")

# Create database tables
cur.execute("""CREATE TABLE IF NOT EXISTS Product (
    maker CHAR(1) NOT NULL,
    model VARCHAR(4) PRIMARY KEY CHECK (model >= 1000),
    type VARCHAR(8) NOT NULL
);""")

cur.execute("""CREATE TABLE IF NOT EXISTS PC (
    model VARCHAR(4) PRIMARY KEY,
    speed DECIMAL(5,2) CHECK (speed > 0),
    ram INTEGER CHECK (ram > 0),
    hd INTEGER CHECK (hd > 0),
    price INTEGER NOT NULL CHECK (price > 0),
    FOREIGN KEY (model) REFERENCES Product(model)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);""")

cur.execute("""CREATE TABLE IF NOT EXISTS Laptop (
    model VARCHAR(4) PRIMARY KEY,
    speed DECIMAL(5,2) CHECK (speed > 0),
    ram INTEGER CHECK (ram > 0),
    hd INTEGER CHECK (hd > 0),
    screen DECIMAL(5,2) CHECK (screen > 0),
    price INTEGER NOT NULL CHECK (price > 0),
    FOREIGN KEY (model) REFERENCES Product(model)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);""")

cur.execute("""CREATE TABLE IF NOT EXISTS Printer (
    model VARCHAR(4) PRIMARY KEY,
    color BOOL NOT NULL,
    type VARCHAR(8),
    price INTEGER NOT NULL CHECK (price > 0),
    FOREIGN KEY (model) REFERENCES Product(model)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);""")

# Try to create indexes
try:
    cur.execute("""CREATE UNIQUE INDEX PC_by_price ON PC (model, price);""")
    cur.execute("""CREATE UNIQUE INDEX Laptop_by_price ON Laptop (model, price);""")
    cur.execute("""CREATE UNIQUE INDEX Printer_by_price ON PC (model, price);""")
    cur.execute("""CREATE UNIQUE INDEX Product_by_maker ON Product (model, maker);""")
    cur.execute("""CREATE UNIQUE INDEX Product_by_type ON Product (model, type);""")
except:
    print("Index creation failed")

# Try to create views
try:
    cur.execute("""CREATE VIEW PC_Extended_Info AS
        SELECT model, speed, ram, hd, price, maker
        FROM Product NATURAL JOIN PC
    ;""")

    cur.execute("""CREATE VIEW Laptop_Extended_Info AS
        SELECT model, speed, ram, hd, price, maker
        FROM Product NATURAL JOIN Laptop
    ;""")

    cur.execute("""CREATE VIEW Printer_Extended_Info AS
        SELECT Printer.model, color, Printer.type, price, maker
        FROM Product JOIN Printer ON Product.model = Printer.model
    ;""")

    cur.execute("""CREATE VIEW Price_Table AS
        SELECT model, price, maker
        FROM PC_Extended_Info
            UNION
        SELECT model, price, maker
        FROM Laptop_Extended_Info
            UNION
        SELECT model, price, maker
        FROM Printer_Extended_Info
    ;""")
except:
    print("View creation failed")

# Load csv files
load_csv(cur, "Product.csv", "Product")
load_csv(cur, "Laptop.csv", "Laptop")
load_csv(cur, "PC.csv", "PC")
load_csv(cur, "Printer.csv", "Printer")
 
# Cleanup
conn.commit()
conn.close()