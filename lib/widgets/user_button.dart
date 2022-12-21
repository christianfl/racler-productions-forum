import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/username_provider/username_provider.dart';
import 'user_avatar.dart';

class UserButton extends StatelessWidget {
  const UserButton({
    super.key,
  });

  /// Indiciate that "you" are the current user with this username
  _indicateCurrentUser(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'Das bist du...',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UsernameProvider usernameProvider = Provider.of<UsernameProvider>(context);

    return Card(
      color: Colors.white10,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => _indicateCurrentUser(context),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const UserAvatar(radius: 14),
              const SizedBox(width: 10),
              Text(
                usernameProvider.username ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
