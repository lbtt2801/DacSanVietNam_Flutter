class Comment {
  final double soSao;
  final String thoiGian;
  final String trangThai;
  final String idDacSan;
  final String idUser;

  Comment({
    required this.soSao,
    required this.thoiGian,
    required this.trangThai,
    required this.idDacSan,
    required this.idUser,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      soSao: json['SoSao'],
      thoiGian: json['ThoiGian'],
      trangThai: json['TrangThai'],
      idDacSan: json['IDDacSan'],
      idUser: json['IDUsers'],
    );
  }
}