class TinhThanh
{
  int? maTT;
  String? ten;

  TinhThanh({
    this.maTT,
    this.ten,
  });

  factory TinhThanh.fromJson(Map<String, dynamic> json) {
    return TinhThanh(
      maTT: json['idtinh'],
      ten: json['tentinh'],
    );
  }
}