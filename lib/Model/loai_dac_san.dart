class LoaiDacSan {
  String idLoaiDS ;
  String tenLoaiDS;
  String moTa;

  LoaiDacSan({
    required this.idLoaiDS,
    required this.tenLoaiDS,
    required this.moTa,
  });

  factory LoaiDacSan.fromJson(Map<String, dynamic> json) {
    return LoaiDacSan(
      idLoaiDS: json['IDLoaiDS'],
      tenLoaiDS: json['TenLoaiDS'],
        moTa: json['MoTa'],
    );
  }
}
