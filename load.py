import csv

# load csv
with open('Tutor.csv', 'r', newline='') as infile:
    reader = csv.reader(infile)
    data = list(reader)  # 将数据读取为列表

# creat tutor table
tutor_table = [['tutor_name', 'education', 'institute', 'status', 'school_name']]
tutor_primary_key = set()  # 用于检查是否有重复的 name

for row in data[1:]:
    name, education, institute, _, status, school_name = row  # 只获取需要的列
    if name not in tutor_primary_key:
        tutor_table.append([name, education, institute, status, school_name])
        tutor_primary_key.add(name)

# create lesson table
subject_table = [['subject_code', 'tutor_name', 'school_name']]  # 包含课程号和老师名字
course_set = set()  # 用于存储所有课程号

for row in data[1:]:
    name, _, _, subjects, _, school_name = row
    subjects = subjects.split(',')  # 将课程号分割成列表
    for subject in subjects:
        if subject.strip() != '':
            course_number = subject.strip()  # 去除课程号两端的空格
            if course_number not in course_set:
                subject_table.append([course_number, name, school_name])
                course_set.add(course_number)

# create school table
school_table = [['school_name']]  # 只包含学区名称
school_set = set()  # 用于检查是否有重复的学区名称

for row in data[1:]:
    _, _, _, _, _, school = row
    if school not in school_set:
        school_table.append([school])
        school_set.add(school)

# create all of them
with open('tutor_table.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerows(tutor_table)

with open('subject_table.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerows(subject_table)

with open('school_table.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerows(school_table)

