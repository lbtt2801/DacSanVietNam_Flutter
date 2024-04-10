class Comment {
  final double soSao;
  final String noiDung;
  final String thoiGian;
  final String trangThai;
  final String idDacSan;
  final String idUser;

  Comment({
    required this.soSao,
    required this.noiDung,
    required this.thoiGian,
    required this.trangThai,
    required this.idDacSan,
    required this.idUser,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      soSao:  double.parse(json['SoSao']),
      noiDung: json['NoiDung'],
      thoiGian: json['ThoiGian'],
      trangThai: json['TrangThai'],
      idDacSan: json['IDDacSan'],
      idUser: json['IDUsers'],
    );
  }
}