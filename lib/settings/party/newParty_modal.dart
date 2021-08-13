import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/common/ui/widget/topBarWithNewForBottomSheet_widget.dart';
import 'package:sentezel/common/ui/widget/topBarWithSaveForBottomSheet_widget.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/party/party_controller.dart';

class NewPartyModal extends HookConsumerWidget {
  final LedgerMaster? payload;
  const NewPartyModal({Key? key, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nameTextEditingController = useTextEditingController(
      text: payload != null ? payload!.name : '',
    );
    final _descriptionTextEditingController = useTextEditingController(
      text: payload != null ? payload!.description : '',
    );
    final _status = useState<ActiveInActive>(
        payload != null ? payload!.status : ActiveInActive.active);

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
                payload == null
                    ? ref.read(partyListControllerProvider.notifier).addParty(
                          LedgerMaster(
                            name: _nameTextEditingController.text,
                            description: _descriptionTextEditingController.text,
                            type: LedgerMasterType.party,
                          ),
                        )
                    : ref
                        .read(partyListControllerProvider.notifier)
                        .updateParty(
                          LedgerMaster.withId(
                            id: payload!.id,
                            name: _nameTextEditingController.text,
                            description: _descriptionTextEditingController.text,
                            type: payload!.type,
                            status: _status.value,
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
                  ListTile(
                    title: Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.2,
                      child: Switch(
                        activeTrackColor: Colors.green.shade400,
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        value: _status.value == ActiveInActive.active
                            ? true
                            : false,
                        onChanged: (value) {
                          _status.value = value == true
                              ? ActiveInActive.active
                              : ActiveInActive.inActive;
                        },
                      ),
                    ),
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
