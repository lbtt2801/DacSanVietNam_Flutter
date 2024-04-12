// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:vinaFoods/Model/dac_san.dart';
import 'package:vinaFoods/Service/thu_vien_api.dart';

import '../Model/comment.dart';
import '../Widget/ButtonSave.dart';
import '../Widget/ShowNoiBan.dart';
import '../Widget/ShowStar.dart';
import '../Widget/xemHinh.dart';
import '../main.dart';

class TrangChiTietDacSan extends StatefulWidget {
  final String maDS;

  const TrangChiTietDacSan({super.key, required this.maDS});

  @override
  _TrangChiTietDacSanState createState() => _TrangChiTietDacSanState();
}

class _TrangChiTietDacSanState extends State<TrangChiTietDacSan> {
  late DacSan dacSan;
  late List<Comment> listComment;
  double rating = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dacSan = dsDacSan.where((ds) => ds.idDacSan == widget.maDS).first;
    listComment = dsComment.where((cm) => cm.idDacSan == widget.maDS).toList();
  }

  @override
  Widget build(BuildContext context) {
    bool isCheck = false;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    dacSan.avatar ??
                        'http://www.clker.com/cliparts/2/l/m/p/B/b/error-md.png',
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(dacSan.tenDS ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.teal,
                      fontSize: 35,
                      fontFamily: 'RobotoBlack')),
            ),
            // const SizedBox(height: 0),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  TextButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsetsDirectional.symmetric(
                          horizontal: 15,
                          vertical: 0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.push("/dacsan/tinhThanh/${dacSan.idTinh}");
                    },
                    child: Text(
                        // "Đặc sản ${getMien(dsDacSan[widget.maDS - 1].idTinh)}",
                        getTenTinhTuID(dacSan.idTinh),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(200, 255, 112, 10),
                            fontSize: 28,
                            fontFamily: 'ExtraBoldItalic')),
                  ),
                  const Spacer(),
                  ButtonSave(idDacSan: widget.maDS, idUser: nguoiDung.uid),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  starNumber(dacSan.sao!),
                  const SizedBox(width: 10),
                  Card(
                    margin: const EdgeInsets.only(bottom: 4),
                    borderOnForeground: isCheck,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 3, bottom: 1),
                      child: Text(
                        dacSan.sao!.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color.fromARGB(255, 211, 211, 211),
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getHinhAnhDS(dacSan.idDacSan ??
                          'https://babettesonline.com/images/thumbs/default-image_1200.png')
                      .length,
                  // itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 320,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => xemHinh(getHinhAnhDS(
                                      dacSan.idDacSan ?? '')[index])),
                            );
                          },
                          child: Hero(
                            tag: 'hinhDS$index',
                            child: Image.network(
                                getHinhAnhDS(dacSan.idDacSan ?? '0')[index],
                                fit: BoxFit.cover,
                                width:
                                    double.infinity, // Đặt chiều rộng mong muốn
                                height: double.infinity),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text('Nội dung',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                      fontSize: 28,
                      fontFamily: "RobotoBlack")),
            ),
            Card(
                color: const Color.fromARGB(255, 242, 242, 242),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(dacSan.moTa ?? '',
                      // textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'RobotoLight',
                          wordSpacing: 1.3,
                          letterSpacing: 0.1,
                          color: Colors.black,
                          fontWeight: FontWeight.w900)),
                )),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text('Nơi bán đề xuất',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                      fontSize: 28,
                      fontFamily: "RobotoBlack")),
            ),
            Card(
                color: const Color.fromARGB(255, 242, 242, 242),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: ShowNoiBanList(idDacSan: dacSan.idDacSan!))),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text('Đánh giá',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                      fontSize: 28,
                      fontFamily: "RobotoBlack")),
            ),
            Card(
                color: const Color.fromARGB(255, 242, 242, 242),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  // child: const RatingWidget()
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 40.0,
                            unratedColor: Colors.grey,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (value) {
                              setState(() {
                                rating = value;
                              });
                            },
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: rating > 0
                                ? () async {
                                    // Xử lý lưu đánh giá và nội dung
                                    // setState(() {
                                    //   // getCommentsFollowIDDacSan(3);
                                    // });
                                    DateTime now = DateTime.now();
                                    String formattedDateTime =
                                        DateFormat('yyyy-MM-dd HH:mm:ss')
                                            .format(now);

                                    //       'SoSao': 2, //soSao,
                                    // 'NoiDung': 'noiDung',
                                    // 'ThoiGian': 'thoiGian',
                                    // 'LuotThich': 0,
                                    // 'LuotDislike': 0,
                                    // 'TrangThai': 1,
                                    // 'IDDacSan': 'DSAN001', //idDacSan,
                                    // 'IDUsers': '24Rajk8NWyYhkPEtfwPBBSFeLCh1', //idUser,
                                    await postComment(
                                        rating.toString(),
                                        reviewController.text,
                                        formattedDateTime,
                                        widget.maDS,
                                        nguoiDung.uid);
                                    await getComment();

                                    setState(() {
                                      listComment = dsComment
                                          .where((cm) =>
                                              cm.idDacSan == widget.maDS)
                                          .toList();
                                    });
                                  }
                                : null,
                            child: const Text('Gửi đánh giá'),
                          ),
                        ],
                      ),
                      TextField(
                        controller: reviewController,
                        maxLength: 200,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Nhập nội dung đánh giá',
                          suffixIcon: reviewController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      reviewController.clear();
                                    });
                                  },
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text('Nhận xét',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                      fontSize: 28,
                      fontFamily: "RobotoBlack")),
            ),
            Card(
                color: const Color.fromARGB(255, 242, 242, 242),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(1.0),
                  // child: ReviewsList(idDacSan: dacSan.idDacSan!)
                  child: SizedBox(
                    height: 300.0,
                    child: ListView.builder(
                      itemCount: listComment.length,
                      itemBuilder: (context, index) {
                        final review = listComment[index];

                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 7.0),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(review.thoiGian ?? 'Time is NULL',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.start),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      getTenUser(review.idUser) ?? 'Guest',
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 112, 10),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  RatingBar.builder(
                                    itemSize: 25.0,
                                    initialRating: double.tryParse(review.soSao ?? '0') ?? 0.0,
                                    minRating: 0,
                                    maxRating: 5,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                    ignoreGestures: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4.0),
                              Text(review.noiDung ?? 'noiDung is NULL')
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  List<String> getHinhAnhDS(String idDacSan) {
    List<String> ds = [];
    for (var ha in dsHinhAnh) {
      if (ha.idDacSan == idDacSan) {
        ds.add(ha.link!);
      }
    }
    return ds;
  }
}
