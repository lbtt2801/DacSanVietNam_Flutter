import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vinaFoods/Model/dac_san.dart';
import 'package:vinaFoods/Service/thu_vien_api.dart';
import 'package:vinaFoods/main.dart';

import '../Model/comment.dart';

class ReviewsList extends StatefulWidget {
  final String idDacSan;

  const ReviewsList({Key? key, required this.idDacSan}) : super(key: key);

  @override
  _ReviewsListState createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  late List<Comment> listComment;

  @override
  void initState() {
    super.initState();

    listComment =
        dsComment.where((cm) => cm.idDacSan == widget.idDacSan).toList();
    // fetchUserNames();
  }

  // void fetchUserNames() {
  //   for (int i = 0; i < widget.reviews.length; i++) {
  //     getNameUser(widget.reviews[i].idUser).then((name) {
  //       setState(() {
  //         nameUsers[i] = name;
  //       });
  //     }).catchError((error) {
  //       print(error);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0 * listComment.length,
      child: ListView.builder(
        itemCount: listComment.length,
        itemBuilder: (context, index) {
          final review = listComment[index];

          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 7.0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review.thoiGian,
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
                            color: Color.fromARGB(255, 255, 112, 10),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    RatingBar.builder(
                      itemSize: 25.0,
                      initialRating: review.soSao.toDouble(),
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
                Text(review.noiDung)
                // Text("Rất tiếc về sự nhầm lẫn. Trong Flutter, Text không hỗ trợ thuộc tính textAlign để đặt canh lề bên trái hoặc bên phải cho văn bản. Thay vào đó, để đạt được kết quả mong muốn, bạn có thể đặt TextAlign.left hoặc TextAlign.right trong style của Text."),
              ],
            ),
          );
        },
      ),
    );
  }
}
