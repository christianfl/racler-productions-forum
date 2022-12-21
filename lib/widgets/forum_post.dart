import 'package:flutter/material.dart';
import 'package:forum/models/forum_post_model.dart';
import 'package:forum/widgets/user_avatar.dart';
import 'package:intl/intl.dart';

class ForumPost extends StatelessWidget {
  final ForumPostModel? post;

  const ForumPost({
    super.key,
    this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8.0),
      color: Colors.green,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Colors.green,
              Colors.blue,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.5, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      UserAvatar(username: post?.createdBy, radius: 8),
                      const SizedBox(width: 5),
                      Text(
                        '${post?.createdBy}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  if (post?.createdAt != null)
                    Text(
                      DateFormat('dd.MM.yyyy  |  kk:mm:ss')
                          .format(post!.createdAt),
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(fontSize: 10),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text('${post?.text}'),
            ],
          ),
        ),
      ),
    );
  }
}
