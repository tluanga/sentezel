import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/container_ledger.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_category_controller.dart';

import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_ledger_select_widget.dart';

import 'new_transaction_ledger_select_controller.dart';

class NewTransactionCategoryScreen extends HookConsumerWidget {
  const NewTransactionCategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _name = useState('');

    final _description = useState('');

    final _transactionType = useState(TransactionType.lei);

    // final _type = useState(transactionCategory!.transactionType);
    final _status = useState<Status>(Status.active);
    ref.watch(newTransactionLedgerSelectControllerProvider.notifier).loadData();
    final state = ref.watch(newTransactionCategoryControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TopBarWithSaveWidget(
                title: 'New Transaction Category',
                onCancel: () {
                  Navigator.pop(context);
                },
                onSave: () {
                  _confirmSheet(context: context, ref: ref);
                  // ref
                  //     .watch(newTransactionCategoryControllerProvider.notifier)
                  //     .save();
                }),
            ContainerLedger(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  _name.value = value;
                  ref
                      .watch(newTransactionCategoryControllerProvider.notifier)
                      .name = value;
                },
                initialValue: _name.value,
              ),
            ),
            ContainerLedger(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Description',
                ),
                onChanged: (value) {
                  ref
                      .watch(newTransactionCategoryControllerProvider.notifier)
                      .description = value;
                },
                initialValue: _description.value,
                minLines: 1,
                maxLines: 4,
              ),
            ),
            //---------------Ledger Select----------

            GestureDetector(
              onTap: () {
                showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        const NewTransactionLedgerSelectWidget(
                          hastransactionCategoryData: false,
                        ));
              },
              child: ContainerLedger(
                child: SizedBox(
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text(
                          ref
                                  .read(newTransactionCategoryControllerProvider
                                      .notifier)
                                  .getLedgerName()
                                  .isEmpty
                              ? 'Please Select Ledger'
                              : ref
                                  .read(newTransactionCategoryControllerProvider
                                      .notifier)
                                  .getLedgerName(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        child: Icon(
                          CupertinoIcons.chevron_down,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //-----------transactionCategoryType

            ContainerLedger(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      'Transaction Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text('Lei'),
                      trailing: Radio(
                        value: TransactionType.lei,
                        onChanged: (value) {
                          ref
                              .watch(newTransactionCategoryControllerProvider
                                  .notifier)
                              .setState(state.copyWith(
                                  transactionType: TransactionType.lei));
                          _transactionType.value = TransactionType.lei;
                        },
                        groupValue: _transactionType.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text('Lakluh'),
                      trailing: Radio(
                        value: TransactionType.lakluh,
                        onChanged: (value) {
                          ref
                              .watch(newTransactionCategoryControllerProvider
                                  .notifier)
                              .setState(state.copyWith(
                                  transactionType: TransactionType.lakluh));
                          _transactionType.value = TransactionType.lakluh;
                        },
                        groupValue: _transactionType.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text('Hralh'),
                      trailing: Radio(
                        value: TransactionType.hralh,
                        onChanged: (value) {
                          ref
                              .watch(newTransactionCategoryControllerProvider
                                  .notifier)
                              .setState(state.copyWith(
                                  transactionType: TransactionType.hralh));
                          _transactionType.value = TransactionType.hralh;
                        },
                        groupValue: _transactionType.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text('Pekchhuah'),
                      trailing: Radio(
                        value: TransactionType.pekchhuah,
                        onChanged: (value) {
                          ref
                              .watch(newTransactionCategoryControllerProvider
                                  .notifier)
                              .setState(state.copyWith(
                                  transactionType: TransactionType.pekchhuah));
                          _transactionType.value = TransactionType.pekchhuah;
                        },
                        groupValue: _transactionType.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ContainerLedger(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    'Active',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              ),
            ),

            //---------Active in Active state
          ],
        ),
      ),
    );
  }
}

_confirmSheet({required BuildContext context, required WidgetRef ref}) {
  final state = ref.watch(newTransactionCategoryControllerProvider);
  List<String> _errorMessages = [];
  if (state.name.isEmpty) {
    _errorMessages.add('Khawngaihin Transaction Category hming dah rawh');
  }
  if (state.description.isEmpty) {
    _errorMessages.add('Khawngaihin description dah rawh');
  }
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
                        child: const Center(
                          child: Text(
                            'Confirm Transaction Category',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          children: [const Text('Name : '), Text(state.name)],
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
                              ref
                                  .watch(
                                      newTransactionCategoryControllerProvider
                                          .notifier)
                                  .save();
                              Navigator.pop(context);
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
