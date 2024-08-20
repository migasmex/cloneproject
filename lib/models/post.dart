import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String uid;
  final String name;
  final String username;
  final String message;
  final Timestamp timestamp;
  final int likeCOunt;
  final List<String> likedBy;

  Post(
      {required this.id,
      required this.uid,
      required this.name,
      required this.username,
      required this.message,
      required this.timestamp,
      required this.likeCOunt,
      required this.likedBy});

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      id: doc.id,
      uid: doc['uid'],
      name: doc['name'],
      username: doc['username'],
      message: doc['message'],
      timestamp: doc['timestamp'],
      likeCOunt: doc['likes'],
      likedBy: List<String>.from(doc['likedBy'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'username': username,
      'message': message,
      'timestamp': timestamp,
      'likes': likeCOunt,
      'likedBy': likedBy,
    };
  }
}
