import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/topBarWithSaveForBottomSheet_widget.dart';
import 'package:sentezel/settings/party/party_controller.dart';

import 'data/party_model.dart';

class NewPartyModal extends HookConsumerWidget {
  final Party? payload;
  const NewPartyModal({Key? key, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nameTextEditingController = useTextEditingController(
      text: payload != null ? payload!.name : '',
    );
    final _descriptionTextEditingController = useTextEditingController(
      text: payload != null ? payload!.description : '',
    );

    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: Column(
          children: [
            TopBarWithSaveForBottomSheetWidget(
              label: 'New Party',
              onSave: () {
                ref.read(partyListControllerProvider.notifier).addParty(
                      Party(
                        name: _nameTextEditingController.text,
                        description: _descriptionTextEditingController.text,
                      ),
                    );
                print(_nameTextEditingController.text);
                Navigator.pop(context);
              },
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTextEditingController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: _descriptionTextEditingController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
