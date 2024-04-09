import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vinaFoods/Service/thu_vien_api.dart';

import '../Model/comment.dart';

class ReviewsList extends StatefulWidget {
  final List<Comment> reviews;

  const ReviewsList({Key? key, required this.reviews}) : super(key: key);

  @override
  _ReviewsListState createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  late List<String> nameUsers;

  @override
  void initState() {
    super.initState();
    nameUsers = List<String>.filled(widget.reviews.length, 'null');
    fetchUserNames();
  }

  void fetchUserNames() {
    for (int i = 0; i < widget.reviews.length; i++) {
      getNameUser(widget.reviews[i].idUser).then((name) {
        setState(() {
          nameUsers[i] = name;
        });
      }).catchError((error) {
        print(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0 * widget.reviews.length,
      child: ListView.builder(
        itemCount: widget.reviews.length,
        itemBuilder: (context, index) {
          final review = widget.reviews[index];
          final nameUser = nameUsers[index];

          return ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(nameUser),
                ),
                RatingBar.builder(
                  itemSize: 20.0,
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
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4.0),
                Text(review.trangThai),
              ],
            ),
          );
        },
      ),
    );
  }
}