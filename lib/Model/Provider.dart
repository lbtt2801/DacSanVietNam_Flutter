import 'package:flutter/material.dart';
import '../Service/thu_vien_api.dart';
import '../Model/dac_san.dart';
import '../main.dart';

class ThuVienProvider extends ChangeNotifier {
  List<DacSan> listYeuThich = dsYeuThich;

  List<DacSan> get dataList => listYeuThich;

  void addDS(dsDS) {
    listYeuThich = dsDS;
    notifyListeners(); // Thông báo cho các widget lắng nghe rằng dữ liệu đã thay đổi
  }
}

// final counterModel = Provider.of<addDSLuu>(context);
