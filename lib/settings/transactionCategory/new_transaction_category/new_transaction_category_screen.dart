import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_category_controller.dart';

import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_ledger_select_widget.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_list_controller.dart';

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

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWithSaveWidget(
                title: 'New Transaction Category',
                onCancel: () {},
                onSave: () {
                  ref
                      .read(transactionCategoryListProvider.notifier)
                      .newTransactionCategory(
                        TransactionCategory(
                          name: _name.value,
                          description: '',
                          transactionType: _transactionType.value,
                          status: _status.value,
                        ),
                      );
                }),
            TextFormField(
              decoration: const InputDecoration(
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
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (value) {
                ref
                    .watch(newTransactionCategoryControllerProvider.notifier)
                    .description = value;
              },
              initialValue: _description.value,
              maxLines: 2,
            ),
            //---------------Ledger Select----------
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        const NewTransactionLedgerSelectWidget());
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text(
                          ref
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
                      'Transaction Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: ListTile(
                      title: const Text('Lei'),
                      trailing: Radio(
                        value: TransactionType.lei,
                        onChanged: (value) {
                          _transactionType.value = TransactionType.lei;
                        },
                        groupValue: _transactionType.value,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: ListTile(
                      title: const Text('Lakluh'),
                      trailing: Radio(
                        value: TransactionType.lakluh,
                        onChanged: (value) {
                          _transactionType.value = TransactionType.lakluh;
                        },
                        groupValue: _transactionType.value,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: ListTile(
                      title: const Text('Hralh'),
                      trailing: Radio(
                        value: TransactionType.hralh,
                        onChanged: (value) {
                          _transactionType.value = TransactionType.hralh;
                        },
                        groupValue: _transactionType.value,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: ListTile(
                      title: const Text('Pekchhuah'),
                      trailing: Radio(
                        value: TransactionType.pekchhuah,
                        onChanged: (value) {
                          _transactionType.value = TransactionType.pekchhuah;
                        },
                        groupValue: _transactionType.value,
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
    );
  }
}
