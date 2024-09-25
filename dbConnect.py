import mysql.connector
from mysql.connector import errorcode

# Database connection details
config = {
    'user': 'guest',
    'password': 'guest',
    'host': '127.0.0.1',
    'database': 'Ecommerce',
    'raise_on_warnings': True
}

# Queries to execute
queries = [
    "SELECT * FROM Customer;",
    "SELECT * FROM Product;",
    "SELECT * FROM `Order` WHERE Status = 'pending';"
]

def execute_queries(cursor, queries):
    for query in queries:
        cursor.execute(query)
        results = cursor.fetchall()
        print(f"Results for query: {query}")
        for row in results:
            print(row)
        print()

try:
    # Connect to the database
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Execute queries
    execute_queries(cursor, queries)

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
finally:
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals():
        cnx.close()
