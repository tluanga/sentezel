import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';

import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_list_controller.dart';

class NewLedgerMasterScreen extends HookConsumerWidget {
  final LedgerMaster? ledgerMaster;
  const NewLedgerMasterScreen({Key? key, this.ledgerMaster}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _name = useState(ledgerMaster != null ? ledgerMaster!.name : '');
    final _description =
        useState(ledgerMaster != null ? ledgerMaster!.description : '');
    final _type = useState(
        ledgerMaster != null ? ledgerMaster!.type : LedgerMasterType.direct);
    final _status = useState<Status>(
        ledgerMaster != null ? ledgerMaster!.status : Status.active);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TopBarWithSaveWidget(
                title: ledgerMaster != null
                    ? 'Update Ledger'
                    : 'New Ledger Master',
                onCancel: () {},
                onSave: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Material(
                          child: SafeArea(
                            top: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent[100]),
                                  child: Center(
                                    child: Text(
                                      ledgerMaster != null
                                          ? 'Confirm update'
                                          : 'Confirm new Ledger',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Row(
                                    children: [
                                      const Text('Ledger Name : '),
                                      Text(_name.value)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Row(
                                    children: [
                                      const Text('Description : '),
                                      Text(_description.value)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Row(
                                    children: [
                                      const Text('Type : '),
                                      Text(_type.value.toString())
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Row(
                                    children: [
                                      const Text('Status : '),
                                      Text(_status.value.toString())
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.blue.shade400),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: const Text(
                                        'Confirm',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.textColor,
                                        ),
                                      ),
                                      leading: const Icon(
                                          CupertinoIcons.checkmark_alt),
                                      onTap: () {
                                        if (ledgerMaster != null) {
                                          ref
                                              .read(
                                                  ledgerMasterListControllerProvider
                                                      .notifier)
                                              .updateLedgerMaster(
                                                LedgerMaster.withId(
                                                  id: ledgerMaster!.id,
                                                  name: _name.value,
                                                  description:
                                                      _description.value,
                                                  type: _type.value,
                                                  status: _status.value,
                                                ),
                                              );
                                        } else {
                                          ref
                                              .read(
                                                  ledgerMasterListControllerProvider
                                                      .notifier)
                                              .addLedgerMaster(
                                                LedgerMaster(
                                                  name: _name.value,
                                                  description:
                                                      _description.value,
                                                  type: _type.value,
                                                ),
                                              );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.red.shade400),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.textColor,
                                        ),
                                      ),
                                      leading:
                                          const Icon(CupertinoIcons.nosign),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  _name.value = value;
                },
                initialValue: ledgerMaster != null ? ledgerMaster!.name : '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                initialValue:
                    ledgerMaster != null ? ledgerMaster!.description : '',
                maxLines: 3,
                onChanged: (value) {
                  _description.value = value;
                },
              ),
              //-----------LedgerMasterType
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Ledger Master Type',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Direct'),
                      trailing: Radio(
                        value: LedgerMasterType.direct,
                        onChanged: (value) {
                          _type.value = LedgerMasterType.direct;
                        },
                        groupValue: _type.value,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(
                        title: const Text('Indirect'),
                        trailing: Radio(
                          value: LedgerMasterType.indirect,
                          onChanged: (value) {
                            _type.value = LedgerMasterType.indirect;
                          },
                          groupValue: _type.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text(
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

              //---------Active in Active state
            ],
          ),
        ),
      ),
    );
  }
}
