import 'package:flutter/material.dart';
import 'package:forum/models/forum_post_model.dart';

class ForumPostProvider with ChangeNotifier {
  List<ForumPostModel>? _posts;

  List<ForumPostModel>? get posts => _posts;

  ForumPostProvider() {
    _loadFromFirestore();
  }

  /// Loads the posts from Firestore into the provider
  _loadFromFirestore() async {
    // TODO: Implement using Firestore. Currently only mocked.

    // Wait 1 sec for better UX
    await Future.delayed(const Duration(seconds: 1));

    _posts = [
      ForumPostModel(
        id: 'id',
        createdBy: 'aabchdhd',
        createdAt: DateTime.now(),
        text:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      ),
      ForumPostModel(
        id: 'id',
        createdBy: 'bhdhsaka',
        createdAt: DateTime.now(),
        text: 'Hallo Welt!',
      ),
      ForumPostModel(
        id: 'id',
        createdBy: 'ifhdhusush',
        createdAt: DateTime.now(),
        text: 'Hey!',
      ),
    ];

    notifyListeners();
  }
}
