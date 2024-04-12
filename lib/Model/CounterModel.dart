import 'package:flutter/material.dart';
import '../Service/thu_vien_api.dart';
import '../Model/dac_san.dart';
import '../main.dart';



class addDSLuu extends ChangeNotifier {
  List<DacSan> dsYeuThich1 = dsYeuThich;

  List<DacSan> get dataList => dsYeuThich1;



  void addDS(idDacSan, idUser) {
    dsYeuThich1 = dsYeuThich;
    notifyListeners(); // Thông báo cho các widget lắng nghe rằng dữ liệu đã thay đổi
  }
}