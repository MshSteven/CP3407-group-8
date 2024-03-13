class tutor_data{
  tutor_data({this.imageUrl, this.name, this.indexLetter});
  final String? imageUrl;
  final String? name;
  final String? indexLetter;
}

List<tutor_data> datas = [
  tutor_data(
    name: '张三',
    indexLetter: 'Z',
  ),

  tutor_data(
    name: '李四',
    indexLetter: 'L',
  ),

  tutor_data(
    name: '王五',
    indexLetter: 'W',
  ),

];