class tutor_data{
  tutor_data({
    required this.imageUrl,
    required this.name,
    required this.indexLetter,
  });
  final String imageUrl;
  final String name;
  final String indexLetter;
}


List<tutor_data> datas = [
  tutor_data(
    imageUrl: 'https://th.bing.com/th/id/OIP.mMGB5_bhd6wmHAl3MymYHAHaGh?rs=1&pid=ImgDetMain',
    name: 'zhang san',
    indexLetter: 'Z',
  ),

  tutor_data(
    imageUrl: 'https://th.bing.com/th/id/OIP.mMGB5_bhd6wmHAl3MymYHAHaGh?rs=1&pid=ImgDetMain',
    name: 'li si',
    indexLetter: 'L',
  ),

  tutor_data(
    imageUrl: 'https://th.bing.com/th/id/OIP.mMGB5_bhd6wmHAl3MymYHAHaGh?rs=1&pid=ImgDetMain',
    name: 'wang wu',
    indexLetter: 'W',
  ),

];