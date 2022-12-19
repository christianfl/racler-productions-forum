import 'package:flutter/material.dart';

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
