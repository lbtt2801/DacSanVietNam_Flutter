class Vung
{
  String? idVung;
  String? tenVung;
  String? mien;

  Vung({
    this.idVung,
    this.tenVung,
    this.mien,
  });

  factory Vung.fromJson(Map<String, dynamic> json) {
    return Vung(
      idVung: json['IDVung'],
      tenVung: json['TenVung'],
      mien: json['Mien'],
    );
  }
}