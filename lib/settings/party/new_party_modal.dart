import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_for_bottom_sheet_widget.dart';

import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';

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
              label: 'New Party',
              onSave: () {
                List<String> _errorMessages = [];
                if (_nameTextEditingController.text.isEmpty) {
                  _errorMessages.add('Khawngaihin Asset Hming dah rawh');
                }
                if (_descriptionTextEditingController.text.isEmpty) {
                  _errorMessages.add('Khawngaihin description dah rawh');
                }

                if (_errorMessages.isEmpty) {
                  payload == null
                      ? ref.read(partyListControllerProvider.notifier).addParty(
                            LedgerMaster(
                              name: _nameTextEditingController.text,
                              description:
                                  _descriptionTextEditingController.text,
                              type: LedgerMasterType.party,
                            ),
                          )
                      : ref
                          .read(partyListControllerProvider.notifier)
                          .updateParty(
                            LedgerMaster.withId(
                              id: payload!.id,
                              name: _nameTextEditingController.text,
                              description:
                                  _descriptionTextEditingController.text,
                              type: payload!.type,
                              status: _status.value,
                            ),
                          );
                  Navigator.pop(context);
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return
                            // );
                            Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Material(
                            child: SafeArea(
                                child: Column(
                              children: [
                                TopBarForBottomSheetWidget(
                                    label: 'Validation Error',
                                    onExit: () {
                                      Navigator.pop(context);
                                    }),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: _errorMessages.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 3,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      CupertinoIcons
                                                          .xmark_octagon,
                                                      color: Colors.red,
                                                      size: 40,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                      child: Center(
                                                        child: Text(
                                                          _errorMessages[index],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            )),
                          ),
                        );

                        //  Material(
                        //   child: SafeArea(
                        //     child: SizedBox(
                        //         height:
                        //             MediaQuery.of(context).size.height * 0.25,
                        //         child: ListView.builder(
                        //           itemCount: _errorMessages.length,
                        //           itemBuilder: (context, index) {
                        //             return Text(_errorMessages[index]);
                        //           },
                        //         )),
                        //   ),
                        // );
                      });
                }
              },
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTextEditingController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: _descriptionTextEditingController,
                    decoration: const InputDecoration(labelText: 'Description'),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
