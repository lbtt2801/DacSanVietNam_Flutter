class NguoiDung {
  String uid;
  String hoTen;
  String email;
  String gioiTinh;
  String? diaChi;

  NguoiDung({
    required this.uid,
    required this.email,
    required this.hoTen,
    required this.gioiTinh,
    this.diaChi,
  });

  factory NguoiDung.fromJson(Map<String, dynamic> json) {
    return NguoiDung(
      uid: json['IDUsers'],
      email: json['Email'],
      gioiTinh: json['GioiTinh'],
      hoTen: json['Ten'],
      diaChi: json['Tinh'],
    );
  }
}
