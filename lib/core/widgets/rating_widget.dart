import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            final percentage = clampDouble(rating - index, 0, 1);
            return Stack(
              children: [
                Icon(Icons.star, color: Colors.grey[800], size: 28),
                ClipRect(
                  clipper: _PercentageClipper(percentage),
                  child: Icon(Icons.star, color: Colors.yellow[700], size: 28),
                ),
              ],
            );
          }),
        ),
        Text(
          '$rating',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

class _PercentageClipper extends CustomClipper<Rect> {
  final double percentage;

  _PercentageClipper(this.percentage);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * percentage, size.height);
  }

  @override
  bool shouldReclip(_PercentageClipper oldClipper) {
    return oldClipper.percentage != percentage;
  }
}
