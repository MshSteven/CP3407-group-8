import csv
import mysql.connector
import sys


def select_tutor(school_name, subject):
    # 连接 MySQL 数据库
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="19981124msh",
        database="tutoring_system"
    )
    db_cursor = db_connection.cursor()

    # 执行查询
    db_cursor.execute("""
    SELECT tutor.tutor_name
    FROM tutor
    JOIN lesson ON tutor.tutor_name = lesson.tutor_name
    JOIN school ON tutor.school_name = school.school_name
    WHERE school.school_name = %s
    AND lesson.lesson_id = %s;
    """, (school_name, subject))
    rows = db_cursor.fetchall()

    # 写入CSV文件
    with open('select_tutor.csv', 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)
        # 写入表头
        csv_writer.writerow([i[0] for i in db_cursor.description])
        # 写入数据
        csv_writer.writerows(rows)

    # 关闭数据库连接
    db_cursor.close()
    db_connection.close()


# 从命令行参数中获取学校名称和科目
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <school_name> <subject>")
        sys.exit(1)

    school_name = sys.argv[1]
    subject = sys.argv[2]
    select_tutor(school_name, subject)
