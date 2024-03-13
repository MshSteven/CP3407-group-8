import mysql.connector

db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="19981124msh",
    database="tutoring_system"
)

db_cursor = db_connection.cursor()

update_queries = [
    "UPDATE User SET id = 1 WHERE username = 'TeamACGN1'",
    "UPDATE User SET id = 2 WHERE username = 'TeamACGN2'",
    "UPDATE User SET id = 3 WHERE username = 'TeamACGN3'"
]
for query in update_queries:
    db_cursor.execute(query)

db_connection.commit()

query = """
    SELECT id, username, password
    FROM User;
"""
db_cursor.execute(query)

result = db_cursor.fetchall()

for row in result:
    print(row)

db_cursor.close()
db_connection.close()
