import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/new_ledger_master_controller.dart';

class NewLedgerMasterScreen extends HookConsumerWidget {
  final LedgerMaster? ledgerMaster;
  const NewLedgerMasterScreen({Key? key, this.ledgerMaster}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(newLedgerMasterControllerProvider);
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
                    _confirmSheet(
                        context: context, ledgerMaster: ledgerMaster, ref: ref);
                  }),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  ref
                      .watch(newLedgerMasterControllerProvider.notifier)
                      .setState(state.name = value);
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
                  ref
                      .watch(newLedgerMasterControllerProvider.notifier)
                      .setState(state.description = value);
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
                          ref
                              .watch(newLedgerMasterControllerProvider.notifier)
                              .setState(state.type = LedgerMasterType.direct);
                        },
                        groupValue: ledgerMaster != null
                            ? ledgerMaster!.type
                            : LedgerMasterType.direct,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(
                        title: const Text('Indirect'),
                        trailing: Radio(
                          value: LedgerMasterType.indirect,
                          onChanged: (value) {
                            ref
                                .watch(
                                    newLedgerMasterControllerProvider.notifier)
                                .setState(
                                    state.type = LedgerMasterType.indirect);
                          },
                          groupValue: ledgerMaster != null
                              ? ledgerMaster!.type
                              : LedgerMasterType.direct,
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
                      ref
                          .watch(newLedgerMasterControllerProvider.notifier)
                          .setState(state.status =
                              value == true ? Status.active : Status.inActive);
                      // _status.value =
                      //     value == true ? Status.active : Status.inActive;
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

_confirmSheet(
    {required BuildContext context,
    required LedgerMaster? ledgerMaster,
    required WidgetRef ref}) {
  List<String> _errorMessages =
      ref.watch(newLedgerMasterControllerProvider.notifier).validate();
  var state = ref.watch(newLedgerMasterControllerProvider);
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _errorMessages.isEmpty
            ? Material(
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.redAccent[100]),
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
                            Text(state.name)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            const Text('Description : '),
                            Text(state.description)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            const Text('Type : '),
                            Text(state.type.toString())
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            const Text('Status : '),
                            Text(state.status.toString())
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue.shade400),
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
                            leading: const Icon(CupertinoIcons.checkmark_alt),
                            onTap: () {
                              if (ledgerMaster != null) {
                                ref
                                    .read(newLedgerMasterControllerProvider
                                        .notifier)
                                    .updateLedgerMaster(id: ledgerMaster.id);
                              } else {
                                ref
                                    .read(newLedgerMasterControllerProvider
                                        .notifier)
                                    .addLedgerMaster();
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
                            border: Border.all(color: Colors.red.shade400),
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
                            leading: const Icon(CupertinoIcons.nosign),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Material(
                child: SafeArea(
                    child: ListView.builder(
                        itemCount: _errorMessages.length,
                        itemBuilder: (context, index) {
                          return Text(_errorMessages[index]);
                        })),
              );
      });
}
