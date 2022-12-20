import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forum/models/forum_post_model.dart';

class ForumPostProvider with ChangeNotifier {
  static const _firestoreCollection = 'posts';
  static const _postLimit = 10;

  List<ForumPostModel>? _posts;

  List<ForumPostModel>? get posts => _posts;

  ForumPostProvider() {
    _listenForPosts();
  }

  /// Loads the posts from Firestore into the provider (listens and updates internal list when FireStore collection updates occur)
  _listenForPosts() async {
    _posts = null;
    notifyListeners();

    final db = FirebaseFirestore.instance;

    // Wait 1 sec for better UX
    await Future.delayed(const Duration(milliseconds: 1000));

    // Listen to posts collection from Firestore and updating interal provider list for posts
    db
        .collection(_firestoreCollection)
        .limit(_postLimit)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      List<ForumPostModel> tempPosts = [];

      for (var document in event.docs) {
        tempPosts.add(ForumPostModel.fromJson(document.data()));
      }

      _posts = tempPosts;

      notifyListeners();
    });
  }

  /// Persist a post to FireStore
  addPost(ForumPostModel post) async {
    final db = FirebaseFirestore.instance;

    await db.collection(_firestoreCollection).add(post.toJson());
  }
}
