import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PinChangeScreen extends HookConsumerWidget {
  const PinChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const Text('Change Your Pin'),
            TextFormField(
              decoration: const InputDecoration(labelText: ' Enter Pin'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Re Enter Pin'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text('Submit')),
            ),
            const SizedBox(
              height: 20,
            ),
            Opacity(
              opacity: 10,
              child: const Icon(
                CupertinoIcons.smallcircle_circle,
                size: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
