// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostModel {
  final int id;
  final String title;
  final String body;
  final List<String> tags;
  final PostModelReactions reactions;
  final int views;
  final int userId;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
    required this.views,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'tags': tags,
      'reactions': reactions.toMap(),
      'views': views,
      'userId': userId,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      tags: List<String>.from(map['tags']),
      reactions: PostModelReactions.fromMap(map['reactions']),
      views: map['views'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, body: $body, tags: $tags, reactions: $reactions, views: $views, userId: $userId)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        listEquals(other.tags, tags) &&
        other.reactions == reactions &&
        other.views == views &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        tags.hashCode ^
        reactions.hashCode ^
        views.hashCode ^
        userId.hashCode;
  }
}

class PostModelReactions {
  final int likes;
  final int dislikes;

  PostModelReactions({required this.likes, required this.dislikes});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'likes': likes, 'dislikes': dislikes};
  }

  factory PostModelReactions.fromMap(Map<String, dynamic> map) {
    return PostModelReactions(likes: map['likes'], dislikes: map['dislikes']);
  }

  String toJson() => json.encode(toMap());

  factory PostModelReactions.fromJson(String source) =>
      PostModelReactions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostModelReactions(likes: $likes, dislikes: $dislikes)';

  @override
  bool operator ==(covariant PostModelReactions other) {
    if (identical(this, other)) return true;

    return other.likes == likes && other.dislikes == dislikes;
  }

  @override
  int get hashCode => likes.hashCode ^ dislikes.hashCode;
}
