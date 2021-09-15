import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_for_bottom_sheet_widget.dart';

import 'package:sentezel/settings/asset/asset_list_controller.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';

class NewAssetModal extends HookConsumerWidget {
  final LedgerMaster? payload;
  const NewAssetModal({Key? key, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nameTextEditingController = useTextEditingController(
      text: payload != null ? payload!.name : '',
    );
    final _descriptionTextEditingController = useTextEditingController(
      text: payload != null ? payload!.description : '',
    );
    final _status =
        useState<Status>(payload != null ? payload!.status : Status.active);

    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: Column(
          children: [
            TopBarWithSaveForBottomSheetWidget(
              label: 'New Asset',
              onSave: () {
                payload == null
                    ? ref.read(assetListControllerProvider.notifier).addAsset(
                          LedgerMaster(
                            name: _nameTextEditingController.text,
                            description: _descriptionTextEditingController.text,
                            type: LedgerMasterType.asset,
                          ),
                        )
                    : ref
                        .read(assetListControllerProvider.notifier)
                        .updateAsset(
                          LedgerMaster.withId(
                            id: payload!.id,
                            name: _nameTextEditingController.text,
                            description: _descriptionTextEditingController.text,
                            type: LedgerMasterType.asset,
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
                        value: _status.value == Status.active ? true : false,
                        onChanged: (value) {
                          _status.value =
                              value == true ? Status.active : Status.inActive;
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
