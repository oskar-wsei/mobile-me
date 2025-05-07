import 'package:flutter/material.dart';

enum TextListType { ordered, unordered }

class TextListWidget extends StatelessWidget {
  final List<String> items;
  final TextListType type;

  const TextListWidget(
    this.items, {
    super.key,
    this.type = TextListType.unordered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          for (final (index, item) in items.indexed)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderBullet(index),
                Expanded(
                  child: Text(item, textAlign: TextAlign.left, softWrap: true),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _renderBullet(int index) {
    if (type == TextListType.ordered) return Text('${index + 1}. ');
    return Text(' \u2022  ');
  }
}
