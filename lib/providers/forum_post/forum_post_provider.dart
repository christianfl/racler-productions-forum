import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forum/models/forum_post_model.dart';

class ForumPostProvider with ChangeNotifier {
  static const _firestoreCollection = 'posts';
  static const _postLimit = 10;

  List<ForumPostModel>? _posts;

  List<ForumPostModel>? get posts => _posts;

  ForumPostProvider() {
    fetch();
  }

  /// Loads the posts from Firestore into the provider
  fetch() async {
    _posts = null;
    notifyListeners();

    final db = FirebaseFirestore.instance;

    // Wait 0.5 sec for better UX
    Future delay = Future.delayed(const Duration(milliseconds: 500));

    // Fetch the posts from Firestore
    Future fetchPosts = db
        .collection(_firestoreCollection)
        .limit(_postLimit)
        .orderBy('createdAt', descending: true)
        //    .snapshots()
        //    .listen((event) {});
        .get()
        .then((collection) {
      final documents = collection.docs;

      List<ForumPostModel> tempPosts = [];

      for (var document in documents) {
        tempPosts.add(ForumPostModel.fromJson(document.data()));
      }

      _posts = tempPosts;
    });

    // Wait at least one second before showing fetched posts
    await Future.wait([delay, fetchPosts]);

    notifyListeners();
  }

  /// Persist a post to FireStore
  addPost(ForumPostModel post) async {
    final db = FirebaseFirestore.instance;

    await db.collection(_firestoreCollection).add(post.toJson());
  }
}
