import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_controller.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

class PinChangeScreen extends HookConsumerWidget {
  const PinChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pinControllerProvider);
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
                title: 'PinChange',
                onClose: () {
                  Navigator.pop(context);
                }),
            const Text('Change Your Pin'),
            TextFormField(
              decoration: const InputDecoration(labelText: ' Enter Pin'),
              onChanged: (value) {
                state.pin = int.parse(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Re Enter Pin'),
              onChanged: (value) {
                ref.read(pinControllerProvider.notifier).checkPassPhrase(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Pass Phrase'),
              onChanged: (value) {
                state.passPhrase = value;
              },
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
            if (state.error!.isNotEmpty) Text(state.error!),
            const Icon(
              CupertinoIcons.smallcircle_circle,
              size: 300,
            ),
          ],
        ),
      ),
    );
  }
}
