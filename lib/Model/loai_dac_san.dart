class LoaiDacSan {
  String idLoaiDS;

  String tenLoaiDS;

  LoaiDacSan({
    required this.idLoaiDS,
    required this.tenLoaiDS,
  });

  factory LoaiDacSan.fromJson(Map<String, dynamic> json) {
    return LoaiDacSan(
      idLoaiDS: json['IDLoaiDS'],
      tenLoaiDS: json['TenLoaiDS'],
    );
  }
}
