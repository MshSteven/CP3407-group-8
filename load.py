import csv

# load csv
with open('Tutor.csv', 'r', newline='') as infile:
    reader = csv.reader(infile)
    data = list(reader)  # 将数据读取为列表

# creat tutor table
tutor_table = [['name', 'education', 'institute', 'status']]
tutor_primary_key = set()  # 用于检查是否有重复的 name

for row in data[1:]:
    name, education, institute, _, status, _ = row  # 只获取需要的列
    if name not in tutor_primary_key:
        tutor_table.append([name, education, institute, status])
        tutor_primary_key.add(name)

# create lesson table
lesson_table = [['course_number', 'tutor_name']]  # 包含课程号和老师名字
course_set = set()  # 用于存储所有课程号

for row in data[1:]:
    name, _, _, lessons, _, _ = row
    lessons = lessons.split(',')  # 将课程号分割成列表
    for lesson in lessons:
        if lesson.strip() != '':
            course_number = lesson.strip()  # 去除课程号两端的空格
            if course_number not in course_set:
                lesson_table.append([course_number, name])
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

with open('lesson_table.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerows(lesson_table)

with open('school_table.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerows(school_table)
