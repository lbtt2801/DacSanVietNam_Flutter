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
                          child: Image.network(
                            noiban.linkAnh,
                            fit: BoxFit.cover,
                            width: 180,
                            height: 130,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/dacsanvietnam-6ee19.appspot.com/o/khong-hien-thi.png?alt=media&token=1f60e24e-735b-4e3b-bb86-f28db5c639f6",
                                fit: BoxFit.cover,
                                width: 180,
                                height: 130,
                              );
                            },
                          ),
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
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            maxLines: 2, // Giới hạn hiển thị tối đa 2 dòng
                            overflow: TextOverflow.ellipsis, // Xử lý văn bản dài bằng dấu ba chấm "..."
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
