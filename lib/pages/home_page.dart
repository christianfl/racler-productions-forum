import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../models/forum_post_model.dart';
import '../providers/forum_post/forum_post_provider.dart';
import '../providers/username_provider/username_provider.dart';
import '../widgets/forum_post.dart';
import '../widgets/send_dialog.dart';
import '../widgets/user_avatar.dart';

class HomePage extends StatefulWidget {
  static const _maxPosts = 10;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String? _username;
  List<ForumPostModel>? _posts;

  @override
  Widget build(BuildContext context) {
    _username = Provider.of<UsernameProvider>(context).username;
    _posts = Provider.of<ForumPostProvider>(context).posts;

    return Scaffold(
      appBar: AppBar(
        title: _username != null
            ? Row(
                children: [
                  const UserAvatar(radius: 16),
                  const SizedBox(width: 5),
                  Text(_username!),
                ],
              )
            : null,
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _posts == null ? HomePage._maxPosts : _posts!.length,
              itemBuilder: (BuildContext context, int index) {
                if (_posts == null) {
                  return Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    loop: 3,
                    child: const ForumPost(),
                  );
                } else {
                  return ForumPost(
                    post: _posts![index],
                  );
                }
              },
            ),
          ),
          const SendDialog(),
        ],
      ),
    );
  }
}
