class Comment {
  final String? soSao;
  final String? noiDung;
  final String? thoiGian;
  final String idDacSan;
  final String idUser;

  Comment( {
    required this.soSao,
    required this.noiDung,
    required this.thoiGian,
    required this.idDacSan,
    required this.idUser,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      soSao:  json['SoSao'].toString(),
      noiDung: json['NoiDung'],
      thoiGian: json['ThoiGian'],
      idDacSan: json['IDDacSan'],
      idUser: json['IDUsers'],
    );
  }
}