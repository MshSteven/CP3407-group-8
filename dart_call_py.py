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

db_cursor.execute("""SELECT * FROM user""")
rows = db_cursor.fetchall()

# 写入CSV文件
with open('users.csv', 'w', newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
        # 写入表头
    csv_writer.writerow([i[0] for i in db_cursor.description])
        # 写入数据
    csv_writer.writerows(rows)

db_connection.commit()

db_cursor.close()
db_connection.close()

