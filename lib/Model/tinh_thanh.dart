class TinhThanh
{
  String? idTinh;
  String? tenTinh;
  String? gioiThieu;
  String? linkAnh;
  String? idVung;

  TinhThanh({
    this.idTinh,
    this.tenTinh,
    this.gioiThieu,
    this.linkAnh,
    this.idVung,
  });

  factory TinhThanh.fromJson(Map<String, dynamic> json) {
    return TinhThanh(
      idTinh: json['IDTinh'],
      tenTinh: json['TenTinh'],
      gioiThieu: json['GioiThieu'],
      linkAnh: json['LinkAnh'],
      idVung: json['IDVung'],
    );
  }
}