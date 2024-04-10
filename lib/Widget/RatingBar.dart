import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vinaFoods/Service/thu_vien_api.dart';
import 'package:vinaFoods/main.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double rating = 0.0;
  TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onPressed: rating > 0.0
                  ? () {
                      // Xử lý lưu đánh giá và nội dung
                      setState(() {
                        getCommentsFollowIDDacSan(3);
                      });

                      print('Rating: $rating');
                      print('Review: ${reviewController.text}');
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
    );
  }
}
