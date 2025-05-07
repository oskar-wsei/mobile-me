import 'package:flutter/material.dart';
import 'package:mobile_me/core/posts/model/post_model.dart';
import 'package:mobile_me/core/widgets/tags_widget.dart';

class PostItemWidget extends StatelessWidget {
  final PostModel post;

  const PostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                post.title,
                style: const TextStyle(
                  fontSize: 24,
                  height: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Text(post.body),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Column(
              spacing: 16,
              children: [
                TagsWidget(tags: post.tags),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 24,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Icon(Icons.thumb_up),
                            ),
                            Text(post.reactions.likes.toString()),
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 7),
                              child: Icon(Icons.thumb_down),
                            ),
                            Text(post.reactions.dislikes.toString()),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        const Icon(Icons.visibility),
                        Text(post.views.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
