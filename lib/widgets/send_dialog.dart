import 'package:flutter/material.dart';
import 'package:forum/models/forum_post_model.dart';
import 'package:provider/provider.dart';

import '../providers/forum_post/forum_post_provider.dart';
import '../providers/username_provider/username_provider.dart';
import 'user_avatar.dart';

class SendDialog extends StatefulWidget {
  const SendDialog({
    super.key,
  });

  @override
  State<SendDialog> createState() => _SendDialogState();
}

class _SendDialogState extends State<SendDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();
  bool isProcessing = false;

  /// Adds a forum post to the backend if input is valid
  _addPost(String username) async {
    // Add post only if form has valid input
    if (_formKey.currentState!.validate()) {
      // Show loading spinner instead of sending button
      setState(() {
        isProcessing = true;
      });

      try {
        final postsProvider =
            Provider.of<ForumPostProvider>(context, listen: false);

        await postsProvider.addPost(
          ForumPostModel(
            createdBy: username,
            createdAt: DateTime.now(),
            text: _postController.text,
          ),
        );

        // Remove the user input from the form field
        _postController.clear();

        // Hide keyboard
        FocusManager.instance.primaryFocus?.unfocus();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fehler beim Abschicken. Bitte probiere es erneut.'),
          ),
        );
      } finally {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UsernameProvider>(context).username;

    return ListTile(
      tileColor: Colors.black,
      title: Form(
        key: _formKey,
        child: TextFormField(
          controller: _postController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Darf nicht leer sein';
            }
            return null;
          },
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Post verfassen ...',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
      leading: const UserAvatar(),
      trailing: isProcessing
          ? const CircularProgressIndicator()
          : IconButton(
              onPressed: username == null ? null : () => _addPost(username),
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
    );
  }
}
