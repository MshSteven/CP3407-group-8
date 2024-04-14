// data.dart

class Tutor {
  final String name;
  final String education;
  final String institute;
  final String status;
  final String schoolName;

  Tutor({
    required this.name,
    required this.education,
    required this.institute,
    required this.status,
    required this.schoolName,
  });
}

class School {
  final String name;

  School({required this.name});
}

class Subject {
  final String code;
  final String tutorName;
  final String schoolName;

  Subject({
    required this.code,
    required this.tutorName,
    required this.schoolName,
  });
}

class User {
  final int userId;
  final String userName;
  final String password;

  User({
    required this.userId,
    required this.userName,
    required this.password,
  });
}

class RateAndReview {
  final int userId;
  final String tutorName;
  final int rate;
  final String review;

  RateAndReview({
    required this.userId,
    required this.tutorName,
    required this.rate,
    required this.review,
  });
}

// 学校数据集合
List<School> schools = [
  School(name: 'JCU SINGAPORE PATHWAYS SCHOOL'),
  School(name: 'JCU SINGAPORE LANGUAGE SCHOOL'),
  School(name: 'JCU SINGAPORE SCHOOL OF SOCIAL AND HEALTH SCIENCES'),
  School(name: 'JCU SINGAPORE SCHOOL OF SCIENCE AND TECHNOLOGY'),
  School(name: 'JCU SINGAPORE BUSINESS SCHOOL'),
  // 添加更多学校...
];

// 导师数据集合
List<Tutor> tutorsData = [
  Tutor(
    name: 'Alice Smith',
    education: 'Ph.D. in Computer Science',
    institute: 'XYZ University',
    status: 'Active',
    schoolName: 'JCU SINGAPORE PATHWAYS SCHOOL',
  ),
  Tutor(
    name: 'Bob Johnson',
    education: 'Master\'s in Business Administration',
    institute: 'ABC University',
    status: 'Active',
    schoolName: 'JCU SINGAPORE BUSINESS SCHOOL',
  ),
  Tutor(
    name: 'Carol Brown',
    education: 'Ph.D. in Economics',
    institute: 'DEF University',
    status: 'Active',
    schoolName: 'JCU SINGAPORE SCHOOL OF INFORMATION TECHNOLOGY',
  ),
  Tutor(
    name: 'David Wilson',
    education: 'Master\'s in Education',
    institute: 'GHI University',
    status: 'Active',
    schoolName: 'JCU SINGAPORE SCHOOL OF EDUCATION',
  ),
  Tutor(
    name: 'Emily Johnson',
    education: 'Ph.D. in Tourism Management',
    institute: 'JKL University',
    status: 'Active',
    schoolName: 'JCU SINGAPORE SCHOOL OF TOURISM AND HOSPITALITY',
  ),
  Tutor(
    name: 'Frank Garcia',
    education: 'Master\'s in Environmental Science',
    institute: 'MNO University',
    status: 'Active',
    schoolName: 'JCU SINGAPORE SCHOOL OF ENVIRONMENTAL SCIENCE',
  ),
  // 添加更多导师...
];

// 科目数据集合
List<Subject> subjectsData = [
  Subject(
    code: 'CS101',
    tutorName: 'Alice Smith',
    schoolName: 'JCU SINGAPORE PATHWAYS SCHOOL',
  ),
  Subject(
    code: 'BUS101',
    tutorName: 'Bob Johnson',
    schoolName: 'JCU SINGAPORE BUSINESS SCHOOL',
  ),
  Subject(
    code: 'IT101',
    tutorName: 'Carol Brown',
    schoolName: 'JCU SINGAPORE SCHOOL OF INFORMATION TECHNOLOGY',
  ),
  Subject(
    code: 'EDU101',
    tutorName: 'David Wilson',
    schoolName: 'JCU SINGAPORE SCHOOL OF EDUCATION',
  ),
  Subject(
    code: 'TH101',
    tutorName: 'Emily Johnson',
    schoolName: 'JCU SINGAPORE SCHOOL OF TOURISM AND HOSPITALITY',
  ),
  Subject(
    code: 'ES101',
    tutorName: 'Frank Garcia',
    schoolName: 'JCU SINGAPORE SCHOOL OF ENVIRONMENTAL SCIENCE',
  ),
  // 添加更多科目...
];

// 用户数据集合
List<User> users = [
  User(
    userId: 1,
    userName: 'user1',
    password: 'password1',
  ),
  User(
    userId: 2,
    userName: 'user2',
    password: 'password2',
  ),
  User(
    userId: 3,
    userName: 'user3',
    password: 'password3',
  ),
  User(
    userId: 4,
    userName: 'user4',
    password: 'password4',
  ),
  User(
    userId: 5,
    userName: 'user5',
    password: 'password5',
  ),
  User(
    userId: 6,
    userName: 'user6',
    password: 'password6',
  ),
  User(
    userId: 7,
    userName: 'user7',
    password: 'password7',
  ),
  // 添加更多用户...
];


// 评分和评论数据集合
List<RateAndReview> rateAndReviews = [
  RateAndReview(
    userId: 2,
    tutorName: 'Alice Smith',
    rate: 4,
    review: 'Good tutor!',
  ),
  RateAndReview(
    userId: 3,
    tutorName: 'Bob Johnson',
    rate: 5,
    review: 'Excellent tutor!',
  ),
  RateAndReview(
    userId: 4,
    tutorName: 'Carol Brown',
    rate: 4,
    review: 'Great tutor!',
  ),
  RateAndReview(
    userId: 5,
    tutorName: 'David Wilson',
    rate: 5,
    review: 'Awesome tutor!',
  ),
  RateAndReview(
    userId: 6,
    tutorName: 'Emily Johnson',
    rate: 4,
    review: 'Helped me a lot!',
  ),
  RateAndReview(
    userId: 7,
    tutorName: 'Frank Garcia',
    rate: 5,
    review: 'Excellent tutor!',
  ),
  // 添加更多评分和评论...
];

