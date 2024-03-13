import pandas as pd
from sqlalchemy import create_engine

db_connection_str = 'mysql+mysqlconnector://root:19981124msh@localhost/tutoring_system'
db_connection = create_engine(db_connection_str)

tutor_df = pd.read_csv('tutor_table.csv', encoding='gbk')
tutor_df.to_sql('tutor', con=db_connection, if_exists='append', index=False, method='multi')

lesson_df = pd.read_csv('lesson_table.csv', encoding='gbk')
lesson_df.to_sql('lesson', con=db_connection, if_exists='append', index=False, method='multi')

school_df = pd.read_csv('school_table.csv', encoding='gbk')
school_df.to_sql('school', con=db_connection, if_exists='append', index=False, method='multi')

