import 'package:flutter/material.dart';
import '../Model/dac_san.dart';
import '../main.dart';

class ThuVienProvider extends ChangeNotifier {
  List<DacSan> listFavorite = dsYeuThich;
  List<DacSan> get dataFavorites => listFavorite;

  List<DacSan> listDacSan = dsDacSan;
  List<DacSan> get dataDacSans => listDacSan;

  void updateListFavorite(dacSans) {
    listFavorite = dacSans;
    notifyListeners(); // Thông báo cho các widget lắng nghe rằng dữ liệu đã thay đổi
  }

  void updateListDacSan(dacSans) {
    listDacSan = dacSans;
    notifyListeners(); // Thông báo cho các widget lắng nghe rằng dữ liệu đã thay đổi
  }
}

// final counterModel = Provider.of<addDSLuu>(context);
