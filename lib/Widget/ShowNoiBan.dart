import 'package:flutter/material.dart';
import 'package:vinaFoods/Model/noi_ban.dart';
import 'package:vinaFoods/Service/thu_vien_api.dart';

import '../Widget/xemHinh.dart';

class ShowNoiBanList extends StatefulWidget {
  final String idDacSan;

  const ShowNoiBanList({super.key, required this.idDacSan});

  @override
  _showNoiBan createState() => _showNoiBan();
}

class _showNoiBan extends State<ShowNoiBanList> {
  late List<NoiBan> listNoiBan;

  @override
  void initState() {
    super.initState();
    listNoiBan = getNoiBanToDacSan(widget.idDacSan);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        width: 350,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listNoiBan.length,
            itemBuilder: (context, index) {
              final noiban = listNoiBan[index];
              return SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width - 20,
                child: Card(
                    child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => xemHinh(noiban.linkAnh),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'hinhDS$index',
                          child: Image.network(noiban.linkAnh ?? "http://www.clker.com/cliparts/2/l/m/p/B/b/error-md.png",
                              fit: BoxFit.cover,
                              width: 180, // Đặt chiều rộng mong muốn
                              height: 130),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noiban.tenQuan,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            noiban.diaChi,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              );
            }));
  }
}
