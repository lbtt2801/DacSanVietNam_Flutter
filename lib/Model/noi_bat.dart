class NoiBat
{
  String? idNoiBat;
  String? idDacSan;

  NoiBat({
    this.idNoiBat,
    this.idDacSan,
  });

  factory NoiBat.fromJson(Map<String, dynamic> json) {
    return NoiBat(
      idNoiBat: json['idnoibat'],
      idDacSan: json['iddacsan'],
    );
  }
}