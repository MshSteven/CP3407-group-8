import mysql.connector

# link mysql
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="19981124msh"
)

db_cursor = db_connection.cursor()
db_cursor.execute("CREATE DATABASE IF NOT EXISTS tutoring_system")
db_cursor.execute("USE tutoring_system")

# creat tutor table
db_cursor.execute("""
    CREATE TABLE IF NOT EXISTS tutor (
        name VARCHAR(255) PRIMARY KEY,
        education VARCHAR(255),
        institute VARCHAR(255),
        status VARCHAR(255)
    )
""")

# create lesson table
db_cursor.execute("""
    CREATE TABLE IF NOT EXISTS lesson (
        course_number VARCHAR(255) PRIMARY KEY,
        tutor_name VARCHAR(255),
        FOREIGN KEY (tutor_name) REFERENCES tutor(name)
    )
""")

# create school table
db_cursor.execute("""
    CREATE TABLE IF NOT EXISTS school (
        school_name VARCHAR(255) PRIMARY KEY
    )
""")

# create user table
db_cursor.execute("""
    CREATE TABLE IF NOT EXISTS User (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(15) UNIQUE NOT NULL,
        password VARCHAR(15) NOT NULL
    )
""")

# creat RateAndReview table
db_cursor.execute("""
    CREATE TABLE IF NOT EXISTS RateAndReview (
    user_id INT,
    tutor_name VARCHAR(50),
    rate INT CHECK (rate >= 0 AND rate <= 100),
    review VARCHAR(1000) CHECK (LENGTH(review) <= 1000),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (tutor_name) REFERENCES Tutor(name)
);
""")

db_connection.commit()

db_cursor.close()
db_connection.close()

