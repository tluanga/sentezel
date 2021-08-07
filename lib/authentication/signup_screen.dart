import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        //Business name
        TextFormField(
          decoration: InputDecoration(labelText: 'Business Name'),
        ),

        //Business Address
        TextFormField(
          decoration: InputDecoration(labelText: 'Business Address'),
        ),
        //User Name
        TextFormField(
          decoration: InputDecoration(labelText: 'User Name'),
        ),

        //-----Passwords-----
        TextFormField(
          decoration: InputDecoration(labelText: 'Business Name'),
        ),
        //-----RetypePasswords-----
        TextFormField(
          decoration: InputDecoration(labelText: 'Business Name'),
        ),
      ],
    );
  }
}
