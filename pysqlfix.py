import csv
import mysql.connector

# link mysql
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="19981124msh",
    database="tutoring_system"
)

# Fix a mistake between tutor and school table
db_cursor = db_connection.cursor()

db_cursor.execute("""
    ALTER TABLE tutor
    DROP FOREIGN KEY tutor_ibfk_1
""")

db_cursor.execute("""
    ALTER TABLE tutor
    DROP COLUMN school_name
""")

db_cursor.execute("""
    ALTER TABLE tutor
    ADD COLUMN school_name VARCHAR(100),
    ADD FOREIGN KEY (school_name) REFERENCES school(school_name)
""")

with open('Tutor.csv', 'r', newline='') as infile:
    reader = csv.DictReader(infile)
    for row in reader:
        tutor_name = row['name']
        school_name = row['school']

        db_cursor.execute("SELECT school_name FROM school WHERE school_name = %s", (school_name,))
        result = db_cursor.fetchone()

        if result:
            db_cursor.execute("UPDATE tutor SET school_name = %s WHERE name = %s", (school_name, tutor_name))

db_connection.commit()

db_cursor.close()
db_connection.close()

