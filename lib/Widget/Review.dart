import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review {
  String username;
  double rating;
  String content;

  Review({required this.username, required this.rating, required this.content});
}

class ReviewsList extends StatelessWidget {
  List<Review> reviews = [
    Review(
      username: 'John',
      rating: 4.5,
      content: 'Great product!',
    ),
    Review(
      username: 'Emily',
      rating: 5.0,
      content: 'Excellent service!',
    ),
    Review(
      username: 'David',
      rating: 3.0,
      content: 'Average experience.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0 * reviews.length, // Đặt chiều cao cố định cho Container
      child: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(review.username),
                ),
                RatingBar.builder(
                  itemSize: 20.0,
                  initialRating: review.rating,
                  minRating: 0,
                  maxRating: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate:(rating) {},
                  ignoreGestures: true, // Ngăn người dùng tương tác
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.0),
                Text(review.content),
              ],
            ),
          );
        },
      ),
    );
  }
}