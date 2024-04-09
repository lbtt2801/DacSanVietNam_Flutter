class HinhAnh
{
  String? idAnh;
  String? idDacSan;
  String? link;

  HinhAnh({
    this.idAnh,
    this.idDacSan,
    this.link,
  });

  factory HinhAnh.fromJson(Map<String, dynamic> json) {
    return HinhAnh(
      idAnh: json['IDHinh'],
      idDacSan: json['IDDacSan'],
      link: json['LinkAnh'],
    );
  }
}