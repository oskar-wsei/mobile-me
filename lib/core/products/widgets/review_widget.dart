import 'package:flutter/material.dart';
import 'package:mobile_me/core/products/model/product_model.dart';
import 'package:mobile_me/core/widgets/rating_widget.dart';

class ReviewWidget extends StatelessWidget {
  final ProductReviewModel review;
  const ReviewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey[700] ?? Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RatingWidget(rating: review.rating),
              SizedBox(width: 10),
              Text(
                review.date.toLocal().toString().split(' ')[0],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(review.comment, style: TextStyle(fontSize: 16)),
          SizedBox(height: 5),
          Text(
            '${review.reviewerName} | ${review.reviewerEmail}',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
