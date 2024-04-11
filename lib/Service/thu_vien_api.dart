import 'dart:convert';

import 'package:http/http.dart';
import 'package:vinaFoods/Model/comment.dart';
import 'package:vinaFoods/Model/noi_ban.dart';

import '../Model/dac_san.dart';
import '../Model/hinh_anh.dart';
import '../Model/loai_dac_san.dart';
import '../Model/nguoi_dung.dart';
import '../Model/tinh_thanh.dart';
import '../Model/vung_mien.dart';
import '../main.dart';

Future<void> addUser(
    String uid, String email, String hoTen, bool isNam, String diaChi) async {
  Map<String, dynamic> data = {
    'IDUsers': uid,
    'Email': email,
    'Ten': hoTen,
    'GioiTinh': isNam ? "Nam" : "Nữ",
    'IDTinh': diaChi,
  };

  var url = Uri.parse('https://cntt199.000webhostapp.com/api/registerUser_OLD.php');
  await post(url, body: data);
}

Future<void> deleteUser(String uid) async {
  Map<String, dynamic> data = {
    'uid': uid,
  };

  var url = Uri.parse('https://cntt199.000webhostapp.com/deleteUser.php');
  await post(url, body: data);
}

Future<void> updateUser(
    String uid, String email, String hoTen, bool isNam, String diaChi) async {
  Map<String, dynamic> data = {
    'uid': uid,
    'email': email,
    'hoten': hoTen,
    'gioitinh': isNam ? "Nam" : "Nữ",
    'diachi': diaChi,
  };

  var url = Uri.parse('https://cntt199.000webhostapp.com/updateUser.php');
  await post(url, body: data);
}

Future<NguoiDung?> getDSUser() async {
  var reponse = await get(
      Uri.parse(
          'https://cntt199.000webhostapp.com/api/getUsers.php'));
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    NguoiDung nguoiDung = NguoiDung.fromJson(document);
    dsNguoiDung.add(nguoiDung);
  }
}

Future<NguoiDung?> getUser(String uid) async {
  for (var nd in dsNguoiDung) {
    if (nd.uid == uid) {
      return nd;
    }
  }
  return null;
}

Future<void> getVung() async {
  var reponse = await get(Uri.parse(
      'https://cntt199.000webhostapp.com/api/getVungAPI.php')); //https://cntt199.000webhostapp.com/getVungMien.php
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    Vung vungMien = Vung.fromJson(document);
    dsVungMien.add(vungMien);
  }
}

Future<void> getLoaiDacSan() async {
  dsLoaiDacSan.insert(0, LoaiDacSan(idLoaiDS: 'all', tenLoaiDS: 'Tất cả'));
  var reponse = await get(Uri.parse(
      'https://cntt199.000webhostapp.com/api/getLoaiDacSan.php')); //https://cntt199.000webhostapp.com/getLoaiDacSan.php
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    LoaiDacSan loaiDacSan = LoaiDacSan.fromJson(document);
    dsLoaiDacSan.add(loaiDacSan);
  }
}

Future<void> getDacSan() async {
  var reponse = await get(Uri.parse(
      'https://cntt199.000webhostapp.com/api/getDacSanAPI.php')); //https://cntt199.000webhostapp.com/getDacSan.php
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    DacSan dacSan = DacSan.fromJson(document);
    dsDacSan.add(dacSan);
  }
}

Future<void> getComment() async {
  var reponse = await get(Uri.parse(
      'https://cntt199.000webhostapp.com/api/getCommentAPI.php')); //https://cntt199.000webhostapp.com/getDacSan.php
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    Comment comment = Comment.fromJson(document);
    dsComment.add(comment);
  }
}



List<DacSan> getDanhSachDacSanTheoTen(String ten) {
  List<DacSan> kq = [];
  for (var dacSan in dsDacSan) {
    if (dacSan.tenDS!.toLowerCase().contains(ten.toLowerCase())) {
      kq.add(dacSan);
    }
  }

  return kq;
}

List<Comment> getCommentsFollowIDDacSan(int idDacSan) {
  List<Comment> kq = [];
  fetchCommentsById(idDacSan).then((comments) {
    dsComment = comments;
    kq = comments;
  }).catchError((error) {
    print(error);
  });
  return kq;
}

Future<List<Comment>> fetchCommentsById(int idDacSan) async {
  final response = await post(
    Uri.parse('https://cntt199.000webhostapp.com/getComments.php'),
    body: {'iddacsan': idDacSan.toString()},
  );
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Comment.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch comments');
  }
}

String? getDacSanTheoTen(String ten) {
  for (var dacSan in dsDacSan) {
    if (dacSan.tenDS! == ten) {
      return dacSan.idDacSan;
    }
  }

  return null;
}

Future<void> getHinhAnh() async {
  var reponse = await get(Uri.parse(
      'https://cntt199.000webhostapp.com/api/getHinhAPI.php')); //https://cntt199.000webhostapp.com/getHinhAnh.php
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    HinhAnh hinhAnh = HinhAnh.fromJson(document);
    dsHinhAnh.add(hinhAnh);
  }
}

Future<void> getNoiBan() async {
  var reponse = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getNoiBanAPI.php'));
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    NoiBan noiBan = NoiBan.fromJson(document);
    dsNoiBan.add(noiBan);
  }
}

String? getTenTinh(String? idTinh) {
  Iterable<TinhThanh> tt =
      dsTinhThanh.where((element) => element.idTinh == idTinh);

  if (tt.isNotEmpty) {
    return tt.first.tenTinh;
  } else {
    return "Không xác định";
  }
}

Future<void> getTinhThanh() async {
  var reponse = await get(Uri.parse(
      'https://cntt199.000webhostapp.com/api/getTinhAPI.php')); // https://cntt199.000webhostapp.com/getTinhThanh.php
  var result = json.decode(utf8.decode(reponse.bodyBytes));

  for (var document in result) {
    TinhThanh tinhThanh = TinhThanh.fromJson(document);
    dsTinhThanh.add(tinhThanh);
  }
}

String getURLImage(String? idImage) {
  String url = 'http://www.clker.com/cliparts/2/l/m/p/B/b/error-md.png';
  int index = dsHinhAnh.indexWhere((hinhAnh) => hinhAnh.idAnh == idImage);
  if (index != -1) {
    return dsHinhAnh[index].link.toString();
  }
  return url;
}

Future<String> getNameUser(String idUser) async {
  final response = await post(
    Uri.parse('https://cntt199.000webhostapp.com/getNameUser.php'),
    body: {'iduser': idUser},
  );

  if (response.statusCode == 200) {
    final dynamic data = jsonDecode(response.body);
    return data.toString();
  } else {
    throw Exception('Failed to fetch name user');
  }
}

List<String?> getTinhTuVung(String? idOfVung) {
  List<TinhThanh> DSTinh =
      dsTinhThanh.where((ds) => ds.idVung == idOfVung).toList();

  List<String?> tenTinhList = DSTinh.map((tinh) => tinh.idTinh).toList();

  return tenTinhList;
}

List<DacSan> getIDTuTenTinh(String? tenTinh) {
  if (tenTinh == ' 👈 Lấy vị trí hiện tại') {
    return dsDacSan;
  }

  TinhThanh? IDTinh = dsTinhThanh.firstWhere((ds) => ds.tenTinh == tenTinh);

  List<DacSan> DSFilterDS =
      dsDacSan.where((ds) => ds.idTinh == IDTinh.idTinh).toList();

  return DSFilterDS;
}

// Lấy tên tỉnh từ ID
String getTinhTuID(String? idTinh) {
  TinhThanh? IDTinh = dsTinhThanh.firstWhere((ds) => ds.idTinh == idTinh);
  return IDTinh.tenTinh.toString();
}

// Lấy tên từ idUser
String? getTenUser(String? idUser) {
  NguoiDung User = dsNguoiDung.firstWhere((ds) => ds.uid == idUser);
  return User.hoTen;
}