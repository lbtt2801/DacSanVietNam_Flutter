class DacSan {
  String? idDacSan;
  String? tenDS;
  String? moTa;
  double? sao;
  String? avatar;
  int? trangThai;
  String? idLoaiDS;
  String? idTinh;

  DacSan({
    this.idDacSan,
    this.tenDS,
    this.moTa,
    this.sao,
    this.avatar,
    this.trangThai,
    this.idLoaiDS,
    this.idTinh,
  });

  factory DacSan.fromJson(Map<String, dynamic> json) {
    return DacSan(
      idDacSan: json['IDDacSan'],
      tenDS: json['TenDS'],
      moTa: json['MoTa'],
      // sao: double.parse(json['Sao'].toStringAsFixed(1)),
      sao: double.parse(json['Sao']),
      avatar: json['Avatar'],
      // trangThai: json['TrangThai'],
      trangThai: int.parse(json['TrangThai']),
      idLoaiDS: json['IDLoaiDS'],
      idTinh: json['IDTinh'],
    );
  }
}
