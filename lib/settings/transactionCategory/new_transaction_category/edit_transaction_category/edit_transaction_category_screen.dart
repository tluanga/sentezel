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
import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_ledger_select_widget.dart';

import 'edit_transaction_category_controller.dart';

class EditTransactionCategoryScreen extends HookConsumerWidget {
  final TransactionCategory? transactionCategory;
  const EditTransactionCategoryScreen({Key? key, this.transactionCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   if (transactionCategory != null) {}
    // }, []);
    ref
        .read(editTransactionCategoryControllerProvider.notifier)
        .loadData(transactionCategory!);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ref.watch(editTransactionCategoryControllerProvider).when(
              data: (data) {
            return Column(
              children: [
                TopBarWithSaveWidget(
                  title: 'New Ledger Master',
                  onCancel: () {
                    ref
                        .read(
                            editTransactionCategoryControllerProvider.notifier)
                        .reset();
                  },
                  onSave: () {
                    //   if (transactionCategory != null) {
                    //     ref
                    //         .read(transactionCategoryListProvider.notifier)
                    //         .updateTransactionCategory(
                    //           TransactionCategory(
                    //             id: 1,
                    //             name: data.name,
                    //             description: '',
                    //             transactionType: _transactionType.value,
                    //             status: _status.value,
                    //           ),
                    //         );
                    //   } else {
                    //     ref
                    //         .read(transactionCategoryListProvider.notifier)
                    //         .newTransactionCategory(
                    //           TransactionCategory(
                    //             name: _name.value,
                    //             description: '',
                    //             transactionType: _transactionType.value,
                    //             status: _status.value,
                    //           ),
                    //         );
                    //   }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    ref
                        .read(
                            editTransactionCategoryControllerProvider.notifier)
                        .setState(data.copyWith(name: value));
                  },
                  initialValue: data.name,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  initialValue: data.description,
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
                            const NewTransactionLedgerSelectWidget(),
                      );
                    },
                    child: data.ledger != null
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Text(
                                      data.ledger.name,
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
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Center(
                                    child: Text(
                                      'Generic',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Icon(
                                      CupertinoIcons.chevron_down,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
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
                              ref
                                  .read(
                                      editTransactionCategoryControllerProvider
                                          .notifier)
                                  .setState(
                                    data.copyWith(
                                        transactionType: TransactionType.lei),
                                  );
                            },
                            groupValue: data.transactionType,
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
                              ref
                                  .read(
                                      editTransactionCategoryControllerProvider
                                          .notifier)
                                  .setState(
                                    data.copyWith(
                                        transactionType:
                                            TransactionType.lakluh),
                                  );
                            },
                            groupValue: data.transactionType,
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
                              ref
                                  .read(
                                      editTransactionCategoryControllerProvider
                                          .notifier)
                                  .setState(
                                    data.copyWith(
                                        transactionType: TransactionType.hralh),
                                  );
                            },
                            groupValue: data.transactionType,
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
                              ref
                                  .read(
                                      editTransactionCategoryControllerProvider
                                          .notifier)
                                  .setState(
                                    data.copyWith(
                                        transactionType:
                                            TransactionType.pekchhuah),
                                  );
                            },
                            groupValue: data.transactionType,
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
                      value: data.status == Status.active ? true : false,
                      onChanged: (value) {
                        data.status == Status.active
                            ? Status.active
                            : Status.inActive;
                      },
                    ),
                  ),
                ),

                //---------Active in Active state
              ],
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, error: (error, stack) {
            return const Text('Error');
          }),
        ),
      ),
    );
  }
}
