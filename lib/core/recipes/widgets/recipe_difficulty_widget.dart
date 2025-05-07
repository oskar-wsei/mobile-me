import 'package:flutter/material.dart';

class RecipeDifficultyWidget extends StatelessWidget {
  final String difficulty;

  const RecipeDifficultyWidget({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: _calculateBackgroundColor(),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            difficulty,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Color _calculateBackgroundColor() {
    if (difficulty == 'Easy') return Colors.greenAccent;
    if (difficulty == 'Medium') return Colors.yellowAccent;
    return Colors.redAccent;
  }
}
