import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Model/dac_san.dart';
import '../Service/thu_vien_widget.dart';
import '../Widget/ShowStar.dart';
import '../main.dart';
import '../Service/thu_vien_api.dart';
import '../Model/Provider.dart';
import 'package:provider/provider.dart';


class TrangDacSanYeuThich extends StatefulWidget {
  const TrangDacSanYeuThich({super.key});

  @override
  _TrangDacSanYeuThichState createState() => _TrangDacSanYeuThichState();
}

class _TrangDacSanYeuThichState extends State<TrangDacSanYeuThich> {
  List<DacSan> dacSans = [];

  @override
  void initState() {
    super.initState();
      dacSans = dsYeuThich;
  }



  @override
  Widget build(BuildContext context) {
    final provder = Provider.of<ThuVienProvider>(context);
    List<DacSan> DacSans = provder.ListYeuThich;
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            shape: LinearBorder.bottom(
              side: const BorderSide(
                color: Color.fromARGB(155, 211, 211, 211),
              ),
            ),
            title: const Text(
              "Danh sách Đặc sản Yêu thích",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: DacSans.isEmpty
                ? ListTile(
                    shape: LinearBorder.bottom(
                      side: const BorderSide(
                        color: Color.fromARGB(155, 211, 211, 211),
                      ),
                    ),
                    title: const Text(
                      "Chưa có Đặc sản Yêu thích !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                  )
                : ListView.builder(
                    itemCount: DacSans.length,
                    itemBuilder: (context, index) {
                      final dacSan = DacSans[index];

                      return InkWell(
                        onTap: () =>
                            context.go("/dacsan/chitiet/${dacSan.idDacSan}"),
                        child: SizedBox(
                          child: Dismissible(
                            key: Key(dacSan.tenDS!),
                            onDismissed: (direction) {
                              setState(() {
                                dsYeuThich.removeAt(index);
                                removeFavorite(nguoiDung.uid, dacSan.idDacSan!);// Xóa mục khỏi danh sách khi bị kéo sang ngang
                                provder.addDS(dsYeuThich);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Đặc sản đã bị xóa",
                                      style: TextStyle(color: Colors.blue),
                                      ),
                                  ));
                            },
                            background: Container(
                              color: Colors.red, // Màu nền hiệu ứng khi kéo sang ngang
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.delete, color: Colors.white), // Icon hoặc widget khác để biểu thị hành động loại bỏ
                            ),
                            child: Card(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Colors.blue[50]
                                      : Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                title: Text(
                                  dacSan.tenDS ?? 'Tên Đặc Sản NULL',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dacSan.sao.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(width: 6),
                                    starNumber(dacSan.sao ?? 0.0),
                                  ],
                                ),
                                leading: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: SizedBox(
                                      width: 100,
                                      child: cachedImage(dacSan.avatar ??
                                          'https://pic.onlinewebfonts.com/thumbnails/icons_305436.svg'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
