class VungMien
{
  String? idVung;
  String? tenVung;
  String? mien;

  VungMien({
    this.idVung,
    this.tenVung,
    this.mien,
  });

  factory VungMien.fromJson(Map<String, dynamic> json) {
    return VungMien(
      idVung: json['IDVung'],
      tenVung: json['TenVung'],
      mien: json['Mien'],
    );
  }
}