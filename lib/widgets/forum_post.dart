import 'package:flutter/material.dart';
import 'package:forum/models/forum_post_model.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${post?.createdBy}',
                  style: Theme.of(context).textTheme.caption,
                ),
                if (post?.createdAt != null)
                  Text(
                    DateFormat('dd.MM.yyyy – kk:mm:ss').format(post!.createdAt),
                    style: Theme.of(context).textTheme.caption,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text('${post?.text}'),
          ],
        ),
      ),
    );
  }
}
