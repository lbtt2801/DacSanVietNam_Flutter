import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinaFoods/Model/dac_san.dart';

import '../Service/thu_vien_widget.dart';
import '../Widget/ShowStar.dart';
import '../main.dart';
import 'package:provider/provider.dart';
import '../Model/CounterModel.dart';


class TrangDacSanYeuThich extends StatefulWidget {
  const TrangDacSanYeuThich({super.key});

  @override
  _TrangDacSanYeuThichState createState() => _TrangDacSanYeuThichState();
}

class _TrangDacSanYeuThichState extends State<TrangDacSanYeuThich> {
  late List<DacSan> DSYeuThich;



  @override
  void initState() {
    super.initState();
    setState(() {
      DSYeuThich = dsYeuThich;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<addDSLuu>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: ElevatedButton(
                onPressed: () {
                setState(() {
                  DSYeuThich = dsYeuThich;
                }
              );
            },
              child: Text('Load lại trang'),
            ),
          ),
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
            child: counterModel.dataList.isEmpty
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
                    itemCount: counterModel.dataList.length,
                    itemBuilder: (context, index) {
                      final dacSan = counterModel.dataList[index];

                      return InkWell(
                        onTap: () =>
                            context.go("/dacsan/chitiet/${dacSan.idDacSan}"),
                        child: SizedBox(
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
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
