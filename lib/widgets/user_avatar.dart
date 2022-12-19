import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/username_provider/username_provider.dart';

class UserAvatar extends StatelessWidget {
  final double? radius;

  const UserAvatar({
    super.key,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    UsernameProvider usernameProvider = Provider.of<UsernameProvider>(context);

    return CircleAvatar(
      radius: radius,
      child: Text(usernameProvider.initials ?? ''),
    );
  }
}
