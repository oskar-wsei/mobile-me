import 'package:flutter/material.dart';

class InfoRowWidget extends StatelessWidget {
  final String label;
  final String value;

  const InfoRowWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$label:', style: TextStyle(fontWeight: FontWeight.w600)),
        Flexible(
          child: Text(
            value,
            style: TextStyle(color: Colors.grey[400]),
            maxLines: 1,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
