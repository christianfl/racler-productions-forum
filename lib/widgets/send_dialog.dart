import 'package:flutter/material.dart';

import 'user_avatar.dart';

class SendDialog extends StatelessWidget {
  const SendDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black,
      title: TextFormField(
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      leading: const UserAvatar(),
      trailing: IconButton(
        onPressed: () => {},
        icon: const Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }
}
