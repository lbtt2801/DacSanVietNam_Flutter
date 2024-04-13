import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

const maxRetryCount = 3; // Số lần thử lại tối đa
const retryDelay = Duration(seconds: 1); // Thời gian chờ giữa các lần thử lại

Future<void> addUser(
    String uid, String email, String hoTen, bool isNam, String diaChi) async {
  Map<String, dynamic> data = {
    'IDUsers': uid,
    'Email': email,
    'Ten': hoTen,
    'GioiTinh': isNam ? "Nam" : "Nữ",
    'IDTinh': diaChi,
  };

  var url =
      Uri.parse('https://cntt199.000webhostapp.com/api/registerUser_OLD.php');
  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await post(url, body: data);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('---------------------- addUser ----------------------');
      }
      return; // Kết thúc hàm sau khi gửi yêu cầu thành công
    } else {
      if (kDebugMode) {
        print('Error registering User: ${response.statusCode}');
      }
    }

    retryCount++;
    await Future.delayed(retryDelay);
  }
  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to register User after $maxRetryCount attempts');
  }
}

Future<void> deleteUser(String uid) async {
  Map<String, dynamic> data = {
    'uid': uid,
  };

  var url = Uri.parse('https://cntt199.000webhostapp.com/deleteUser.php');
  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await post(url, body: data);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('---------------------- deleteUser ----------------------');
      }
      return; // Kết thúc hàm sau khi gửi yêu cầu thành công
    } else {
      if (kDebugMode) {
        print('Error deleting User: ${response.statusCode}');
      }
    }

    retryCount++;
    await Future.delayed(retryDelay);
  }
  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to delete User after $maxRetryCount attempts');
  }
}

Future<void> updateUser(
    String uid, String email, String hoTen, bool isNam, String diaChi) async {
  Map<String, dynamic> data = {
    'IDUsers': uid,
    'Email': email,
    'Ten': hoTen,
    'GioiTinh': isNam ? "Nam" : "Nữ",
    'IDTinh': diaChi,
  };

  var url = Uri.parse('https://cntt199.000webhostapp.com/api/updateUser.php');
  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await post(url, body: data);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('---------------------- updateUser ----------------------');
      }
      return; // Kết thúc hàm sau khi gửi yêu cầu thành công
    } else {
      if (kDebugMode) {
        print('Error updating User: ${response.statusCode}');
      }
    }

    retryCount++;
    await Future.delayed(retryDelay);
  }
  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to update User after $maxRetryCount attempts');
  }
}

Future<void> getDSUser() async {
  var response = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getUsers.php'));
  if (response.statusCode == 200) {
    var result = json.decode(utf8.decode(response.bodyBytes));

    for (var document in result) {
      NguoiDung nguoiDung = NguoiDung.fromJson(document);
      dsNguoiDung.add(nguoiDung);
    }
    if (kDebugMode) {
      print('---------------------- getDSUser ----------------------');
    }
  } else {
    if (kDebugMode) {
      print('Error: ${response.statusCode}');
      print('Error - CallBack');
    }
    Timer(const Duration(seconds: 1), getDSUser);
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

Future<void> addFavorite(String idDacSan, String idUser) async {
  Map<String, dynamic> data = {
    'IDDacSan': idDacSan,
    'IDUsers': idUser,
  };

  var url = Uri.parse('https://cntt199.000webhostapp.com/api/addFavorite.php');

  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await post(url, body: data);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('---------------------- addFavorite ----------------------');
      }
      return; // Kết thúc hàm sau khi gửi yêu cầu thành công
    } else {
      if (kDebugMode) {
        print('Error posting comment: ${response.statusCode}');
      }
    }

    retryCount++;
    await Future.delayed(retryDelay);
  }
  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to post comment after $maxRetryCount attempts');
  }
}

Future<void> getFavorite(String idUser) async {
  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await get(Uri.parse(
        'https://cntt199.000webhostapp.com/api/getFavorite.php?IDUsers=$idUser'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List<String> lst = List<String>.from(data);
      if (dsYeuThich.isNotEmpty) dsYeuThich.clear();
      for (String id in lst) {
        DacSan? dacSan = getDacSanTheoID(id);
        dsYeuThich.add(dacSan);
      }
      if (kDebugMode) {
        print('---------------------- getFavorite ----------------------');
      }
      return;
    } else {
      if (kDebugMode) {
        print('Error getting Favorite: ${response.statusCode}');
      }
    }
    retryCount++;
    await Future.delayed(retryDelay);
  }

  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to post comment after $maxRetryCount attempts');
  }
}

Future<void> removeFavorite(String idUser, String idDacSan) async {
  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await get(Uri.parse(
        'https://cntt199.000webhostapp.com/api/removeFavorite.php?IDUsers=$idUser&IDDacSan=$idDacSan'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (kDebugMode) {
        print('---------------------- removeFavorite ----------------------');
      }
      return; // Kết thúc hàm sau khi gửi yêu cầu thành công
    } else {
      if (kDebugMode) {
        print('Error removing Favorite: ${response.statusCode}');
      }
    }
    retryCount++;
    await Future.delayed(retryDelay);
  }

  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to post comment after $maxRetryCount attempts');
  }
}

Future<void> getVung() async {
  var response = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getVungAPI.php'));
  if (response.statusCode == 200) {
    var result = json.decode(utf8.decode(response.bodyBytes));

    for (var document in result) {
      Vung vungMien = Vung.fromJson(document);
      dsVungMien.add(vungMien);
    }
    if (kDebugMode) {
      print('---------------------- getVung ----------------------');
    }
  } else {
    if (kDebugMode) {
      print('Error: ${response.statusCode}');
      print('Error - CallBack');
    }
    Timer(const Duration(seconds: 1), getVung);
  }
}

Future<void> getLoaiDacSan() async {
  dsLoaiDacSan.insert(0, LoaiDacSan(idLoaiDS: 'all', tenLoaiDS: 'Tất cả'));

  var response = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getLoaiDacSan.php'));
  if (response.statusCode == 200) {
    var result = json.decode(utf8.decode(response.bodyBytes));

    for (var document in result) {
      LoaiDacSan loaiDacSan = LoaiDacSan.fromJson(document);
      dsLoaiDacSan.add(loaiDacSan);
    }
    if (kDebugMode) {
      print('---------------------- getLoaiDacSan ----------------------');
    }
  } else {
    if (kDebugMode) {
      print('Error: ${response.statusCode}');
      print('Error - CallBack');
    }
    Timer(const Duration(seconds: 1), getLoaiDacSan);
  }
}

Future<void> getDacSan() async {
  var response = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getDacSanAPI.php'));
  if (response.statusCode == 200) {
    var result = json.decode(utf8.decode(response.bodyBytes));

    for (var document in result) {
      DacSan dacSan = DacSan.fromJson(document);
      if (dacSan.trangThai == 1) {
        dsDacSan.add(dacSan);
      }
    }
    if (kDebugMode) {
      print('---------------------- getDacSan ----------------------');
    }
  } else {
    if (kDebugMode) {
      print('Error: ${response.statusCode}');
      print('Error - CallBack');
    }
    Timer(const Duration(seconds: 1), getDacSan);
  }
}

Future<void> updatePropsSao(String idDacSan, String soSao) async {
  Map<String, dynamic> data = {
    'IDDacSan': idDacSan,
    'Sao': soSao,
  };

  var url =
      Uri.parse('https://cntt199.000webhostapp.com/api/updatePropsSao.php');

  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await post(url, body: data);

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('---------------------- updatePropsSao ----------------------');
      }
      return; // Kết thúc hàm sau khi gửi yêu cầu thành công
    } else {
      if (kDebugMode) {
        print('Error updating Props Sao: ${response.statusCode}');
      }
    }

    retryCount++;
    await Future.delayed(retryDelay);
  }

  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to update Props Sao after $maxRetryCount attempts');
  }
}

Future<void> postComment(String soSao, String noiDung, String thoiGian,
    String idDacSan, String idUser) async {
  Map<String, dynamic> data = {
    'SoSao': soSao,
    'NoiDung': noiDung,
    'ThoiGian': thoiGian,
    'IDDacSan': idDacSan,
    'IDUsers': idUser,
  };

  var url = Uri.parse('https://cntt199.000webhostapp.com/api/postComment.php');

  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    try {
      var response = await post(url, body: data);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('---------------------- postComment ----------------------');
        }
        return; // Kết thúc hàm sau khi gửi yêu cầu thành công
      } else {
        if (kDebugMode) {
          print('Error posting comment: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (error is SocketException) {
        showCustomToast('Kết nối mạng có vấn đề. Vui lòng thử lại sau!');
      } else if (error is ClientException) {
        showCustomToast('ClientException. Vui lòng thử lại sau!');
      } else {
        showCustomToast('Lỗi không xác định. Vui lòng thử lại sau!');
      }
    }

    retryCount++;
    await Future.delayed(retryDelay);
  }

  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to post comment after $maxRetryCount attempts');
  }
}

Future<void> updateComment(String soSao, String noiDung, String thoiGian,
    String idDacSan, String idUser) async {
  Map<String, dynamic> data = {
    'SoSao': soSao,
    'NoiDung': noiDung,
    'ThoiGian': thoiGian,
    'IDDacSan': idDacSan,
    'IDUsers': idUser,
  };

  var url =
      Uri.parse('https://cntt199.000webhostapp.com/api/updateComment.php');

  int retryCount = 0;
  while (retryCount < maxRetryCount) {
    var response = await post(url, body: data);

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('---------------------- updateComment ----------------------');
      }
      return; // Kết thúc hàm sau khi gửi yêu cầu thành công
    } else {
      if (kDebugMode) {
        print('Error updating comment: ${response.statusCode}');
      }
    }

    retryCount++;
    await Future.delayed(retryDelay);
  }

  // Thông báo khi đã thử lại đủ số lần nhưng không thành công
  if (kDebugMode) {
    print('Failed to update comment after $maxRetryCount attempts');
  }
}

Future<void> getComment() async {
  var response = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getCommentAPI.php'));
  if (response.statusCode == 200) {
    var result = json.decode(utf8.decode(response.bodyBytes));

    if (dsComment.isNotEmpty) dsComment.clear();
    for (var document in result) {
      Comment comment = Comment.fromJson(document);
      // if(comment.trangThai == "1") {
      dsComment.add(comment);
      // }
    }
    if (kDebugMode) {
      print('---------------------- getComment ----------------------');
    }
  } else {
    if (kDebugMode) {
      print('Error: ${response.statusCode}');
      print('Error - CallBack');
    }
    Timer(const Duration(seconds: 1), getComment);
  }
}

void updateListCommentIdUser(List<Comment> listData, String soSao,
    String noiDung, String thoiGian, String idDacSan, String idUser) {
  for (int i = 0; i < listData.length; i++) {
    if (listData[i].idUser == idUser) {
      listData[i] = Comment(
        soSao: soSao,
        noiDung: noiDung,
        thoiGian: thoiGian,
        idDacSan: idDacSan,
        idUser: idUser,
      );
      break;
    }
  }
}

List<DacSan> updateListDacSan(
    List<DacSan> listData, double soSao, String idDacSan) {
  for (int i = 0; i < listData.length; i++) {
    if (listData[i].idDacSan == idDacSan) {
      listData[i].sao = soSao;
      break;
    }
  }
  return listData;
}

DacSan getDacSanTheoID(String idDacSan) {
  for (var dacSan in dsDacSan) {
    if (dacSan.idDacSan == idDacSan) {
      return dacSan;
    }
  }
  return dsDacSan[0];
}

Future<void> getHinhAnh() async {
  var response = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getHinhAPI.php'));
  if (response.statusCode == 200) {
    var result = json.decode(utf8.decode(response.bodyBytes));

    for (var document in result) {
      HinhAnh hinhAnh = HinhAnh.fromJson(document);
      dsHinhAnh.add(hinhAnh);
    }

    if (kDebugMode) {
      print('---------------------- getHinhAnh ----------------------');
    }
  } else {
    if (kDebugMode) {
      print('Error: ${response.statusCode}');
      print('Error - CallBack');
    }
    Timer(const Duration(seconds: 1), getHinhAnh);
  }
}

Future<void> getNoiBan() async {
  var response = await get(
      Uri.parse('https://cntt199.000webhostapp.com/api/getNoiBanAPI.php'));
  if (response.statusCode == 200) {
    var result = json.decode(utf8.decode(response.bodyBytes));

    for (var document in result) {
      NoiBan noiBan = NoiBan.fromJson(document);
      dsNoiBan.add(noiBan);
    }

    if (kDebugMode) {
      print('---------------------- getNoiBan ----------------------');
    }
  } else {
    if (kDebugMode) {
      print('Error: ${response.statusCode}');
      print('Error - CallBack');
    }
    Timer(const Duration(seconds: 1), getNoiBan);
  }
}

Future<void> getTinhThanh() async {
  try {
    var response = await get(
        Uri.parse('https://cntt199.000webhostapp.com/api/getTinhAPI.php'));
    if (response.statusCode == 200) {
      var result = json.decode(utf8.decode(response.bodyBytes));

      for (var document in result) {
        TinhThanh tinhThanh = TinhThanh.fromJson(document);
        dsTinhThanh.add(tinhThanh);
      }

      if (kDebugMode) {
        print('---------------------- getTinhThanh ----------------------');
      }
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
        print('Error - CallBack');
      }
      Timer(const Duration(seconds: 1), getTinhThanh);
    }
  } catch (error) {
    if (error is SocketException) {
      showCustomToast('Kết nối mạng có vấn đề. Vui lòng thử lại sau!');
    } else if (error is ClientException) {
      showCustomToast('ClientException. Vui lòng thử lại sau!');
    } else {
      showCustomToast('Lỗi không xác định. Vui lòng thử lại sau!');
    }
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

List<String?> getTinhTuVung(String? idVung) {
  List<TinhThanh> dsTinh =
      dsTinhThanh.where((ds) => ds.idVung == idVung).toList();

  List<String?> tenTinhList = dsTinh.map((tinh) => tinh.idTinh).toList();

  return tenTinhList;
}

List<DacSan> getListDacSanTuTenTinh(String tenTinh, List<DacSan> dacSans) {
  List<DacSan> dsFilter = [];
  TinhThanh tinhThanh = TinhThanh();

  tinhThanh = dsTinhThanh.firstWhere((ds) => ds.tenTinh == tenTinh,
      orElse: () => tinhThanh);

  if (tinhThanh.idTinh == null) {
    return dsFilter;
  }

  dsFilter = dacSans.where((ds) => ds.idTinh == tinhThanh.idTinh).toList();
  return dsFilter;
}

// void getListDacSanTuTenTinh(String tenTinh, List<DacSan> dacSans) {
//   dsGanBan = [];
//   TinhThanh tinhThanh = TinhThanh();
//
//   tinhThanh = dsTinhThanh.firstWhere((ds) => ds.tenTinh == tenTinh,
//       orElse: () => tinhThanh);
//
//   dsGanBan = dacSans.where((ds) => ds.idTinh == tinhThanh.idTinh).toList();
// }

// Lấy tên tỉnh từ ID
String getTenTinhTuID(String? idTinh) {
  TinhThanh? tinhThanh = dsTinhThanh.firstWhere((ds) => ds.idTinh == idTinh);
  return tinhThanh.tenTinh.toString();
}

// Lấy tên từ idUser
String? getTenUser(String? idUser) {
  NguoiDung user = dsNguoiDung.firstWhere((ds) => ds.uid == idUser);
  return user.hoTen;
}

// Lấy noi bán từ idDaSan
List<NoiBan> getNoiBanToDacSan(String idDS) {
  List<NoiBan> ds = dsNoiBan.where((ds) => ds.idDacSan == idDS).toList();
  return ds;
}

// Lấy tỉnh từ id
TinhThanh getTinhTuID(String id) {
  TinhThanh tt = dsTinhThanh.firstWhere((ds) => ds.idTinh == id);
  return tt;
}

// Toast
void showCustomToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

// update props Sao of DacSan
double updateSaoDacSan(List<Comment> comments, String idDacSan) {
  DacSan dacSan = getDacSanTheoID(idDacSan);

  double total = 0;
  for (Comment comment in comments) {
    total += double.tryParse(comment.soSao ?? '0.0') ?? 0.0;
  }

  dacSan.sao = total / comments.length;
  String format = dacSan.sao?.toStringAsFixed(1) ?? '0.0';
  dacSan.sao = double.parse(format);
  return dacSan.sao ?? 0.0;
}
