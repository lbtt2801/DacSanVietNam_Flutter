class NoiBan {
  String idNoiBan;
  String tenQuan;
  String diaChi;
  String linkAnh;
  String? trangThai;
  String idDacSan;

  NoiBan({
    required this.idNoiBan,
    required this.tenQuan,
    required this.diaChi,
    required this.linkAnh,
    required this.trangThai,
    required this.idDacSan,
  });

  factory NoiBan.fromJson(Map<String, dynamic> json) {
    return NoiBan(
      idNoiBan: json['IDNoiBan'],
      tenQuan: json['TenQuan'],
      diaChi: json['DiaChi'],
      linkAnh: json['LinkAnh'],
      trangThai: json['TrangThai'],
      idDacSan: json['IDDacSan'],
    );
  }
}
