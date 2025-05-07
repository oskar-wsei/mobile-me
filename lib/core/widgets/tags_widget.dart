import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  final List<String> tags;

  const TagsWidget({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: [
          for (final tag in tags)
            Text('#$tag', style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
