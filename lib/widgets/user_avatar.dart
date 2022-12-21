import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/username_provider/username_provider.dart';

class UserAvatar extends StatelessWidget {
  /// If not given, shows the current user's initials
  final String? username;
  final double? radius;

  const UserAvatar({
    super.key,
    this.username,
    this.radius,
  });

  /// Returns the initials of the current user or of the given user (if present)
  String _getInitials(UsernameProvider provider) {
    if (username != null) {
      return provider.getInitials(username);
    } else {
      return provider.initials;
    }
  }

  /// Transforms the initials into a color using hashing
  Color _getColor(UsernameProvider provider) {
    final rgbString = _getInitials(provider)
        .hashCode
        .toRadixString(16)
        .padLeft(6, '0')
        .substring(0, 6);

    final y = '0xff$rgbString';

    try {
      return Color(int.parse(y));
    } catch (e) {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    UsernameProvider usernameProvider = Provider.of<UsernameProvider>(context);

    return CircleAvatar(
      radius: radius,
      backgroundColor: _getColor(usernameProvider),
      child: Text(
        _getInitials(usernameProvider),
        style: TextStyle(
          fontSize: radius,
          color: Colors.white,
          shadows: const [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 4.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
