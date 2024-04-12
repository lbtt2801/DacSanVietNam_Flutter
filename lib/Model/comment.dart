class Comment {
  final String? soSao;
  final String? noiDung;
  final String? thoiGian;
  final String idDacSan;
  final String idUser;
  // final String trangThai;

  Comment( {
    required this.soSao,
    required this.noiDung,
    required this.thoiGian,
    required this.idDacSan,
    required this.idUser,
    // required this.trangThai,

  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      soSao:  json['SoSao'].toString(),
      noiDung: json['NoiDung'],
      thoiGian: json['ThoiGian'],
      idDacSan: json['IDDacSan'],
      idUser: json['IDUsers'],
        // trangThai = int.parse(json['TrangThai'] ?? '1');
    );
  }
}