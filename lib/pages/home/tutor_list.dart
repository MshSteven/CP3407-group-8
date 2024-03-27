class tutor_data {
  tutor_data({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.indexLetter,
  });

  final int id; // 新增的id属性
  final String imageUrl;
  final String name;
  final String indexLetter;
}

List<tutor_data> datas = [
  tutor_data(
    id: 1,
    imageUrl: 'https://th.bing.com/th/id/OIP.mMGB5_bhd6wmHAl3MymYHAHaGh?rs=1&pid=ImgDetMain',
    name: 'zhang san',
    indexLetter: 'Z',
  ),

  tutor_data(
    id: 2,
    imageUrl: 'https://th.bing.com/th/id/OIP.mMGB5_bhd6wmHAl3MymYHAHaGh?rs=1&pid=ImgDetMain',
    name: 'li si',
    indexLetter: 'L',
  ),

  tutor_data(
    id: 3,
    imageUrl: 'https://th.bing.com/th/id/OIP.mMGB5_bhd6wmHAl3MymYHAHaGh?rs=1&pid=ImgDetMain',
    name: 'wang wu',
    indexLetter: 'W',
  ),

  tutor_data(
    id: 4,
    imageUrl: 'https://th.bing.com/th/id/OIP.mMGB5_bhd6wmHAl3MymYHAHaGh?rs=1&pid=ImgDetMain',
    name: 'zhang si',
    indexLetter: 'Z',
  ),

];