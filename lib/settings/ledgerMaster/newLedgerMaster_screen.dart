import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

import 'package:sentezel/common/enums/activeInActive_enum.dart';

import 'package:sentezel/common/enums/ledgerMasterType_enum.dart';
import 'package:sentezel/common/ui/widget/topBarNewItem_widget.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_controller.dart';

import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';

class NewLedgerMasterScreen extends HookConsumerWidget {
  final LedgerMaster? ledgerMaster;
  NewLedgerMasterScreen({Key? key, this.ledgerMaster}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _name = useState(ledgerMaster != null ? ledgerMaster!.name : '');
    final _type = useState(
        ledgerMaster != null ? ledgerMaster!.type : LedgerMasterType.direct);
    final _status = useState<ActiveInActive>(
        ledgerMaster != null ? ledgerMaster!.status : ActiveInActive.active);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TopBarNewItemWidget(
                title: 'New Ledger Master',
                onSave: () {
                  print('value of name is');
                  if (ledgerMaster != null)
                    ref
                        .read(ledgerMasterListControllerProvider.notifier)
                        .updateLedgerMaster(
                          LedgerMaster(
                            id: Uuid().v4(),
                            name: _name.value,
                            description: '',
                            type: _type.value,
                            status: _status.value,
                          ),
                        );
                  else {
                    ref
                        .read(ledgerMasterListControllerProvider.notifier)
                        .addLedgerMaster(
                          LedgerMaster(
                            id: Uuid().v4(),
                            name: _name.value,
                            description: '',
                            type: _type.value,
                            status: _status.value,
                          ),
                        );
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  _name.value = value;
                },
                initialValue: ledgerMaster != null ? ledgerMaster!.name : '',
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                initialValue:
                    ledgerMaster != null ? ledgerMaster!.description : '',
                maxLines: 3,
              ),
              //-----------LedgerMasterType
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Ledger Master Type',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Direct'),
                      trailing: Radio(
                        value: LedgerMasterType.direct,
                        onChanged: (value) {
                          print('before change value ${_type.value}');
                          _type.value = LedgerMasterType.direct;
                          print('Change value ${_type.value}');
                        },
                        groupValue: _type.value,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(0),
                      child: ListTile(
                        title: Text('Indirect'),
                        trailing: Radio(
                          value: LedgerMasterType.indirect,
                          onChanged: (value) {
                            print('before change value ${_type.value}');
                            _type.value = LedgerMasterType.indirect;
                            print('Change value ${_type.value}');
                          },
                          groupValue: _type.value,
                        ),
                      ),
                    ),
                  ],
                ),
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
                    value:
                        _status.value == ActiveInActive.active ? true : false,
                    onChanged: (value) {
                      _status.value = value == true
                          ? ActiveInActive.active
                          : ActiveInActive.inActive;
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
