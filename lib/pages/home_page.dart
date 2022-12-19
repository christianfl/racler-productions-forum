import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/forum_post_model.dart';
import '../providers/username_provider/username_provider.dart';
import '../widgets/forum_post.dart';
import '../widgets/send_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String? _username;
  final List<ForumPostModel> _posts = [
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

  @override
  Widget build(BuildContext context) {
    _username = Provider.of<UsernameProvider>(context).username;

    return Scaffold(
      appBar: AppBar(
        title: _username != null ? Text(_username!) : null,
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
              itemCount: _posts.length,
              itemBuilder: (BuildContext context, int index) {
                return ForumPost(
                  post: _posts[index],
                );
              },
            ),
          ),
          const SendDialog(),
        ],
      ),
    );
  }
}
