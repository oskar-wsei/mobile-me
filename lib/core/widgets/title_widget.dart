import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final IconData? icon;

  const TitleWidget({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 18, top: 16, bottom: 8),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          _buildIcon(),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    if (icon == null) return Container();
    return Row(children: [Icon(icon, size: 28), SizedBox(width: 8)]);
  }
}
