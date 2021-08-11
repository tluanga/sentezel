import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/topBarWithSaveForBottomSheet_widget.dart';

class NewPartyModal extends HookConsumerWidget {
  const NewPartyModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Column(
        children: [
          TopBarWithSaveForBottomSheetWidget(
            label: 'New Party',
            onSave: () {},
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
    );
  }
}
