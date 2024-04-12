class DacSanLuu {
  int? idUser;
  int? idDacSan;

  DacSanLuu({
    this.idUser,
    this.idDacSan,
  });

  factory DacSanLuu.fromJson(Map<String, dynamic> json) {
    return DacSanLuu(
      idUser: json['IDUsers'],
      idDacSan: json['IDDacSan'],
    );
  }
}
