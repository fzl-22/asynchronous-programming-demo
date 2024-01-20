import 'package:flutter/material.dart';

class UserSeparator extends StatelessWidget {
  const UserSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 80,
      color: Colors.grey.shade300,
    );
  }
}
