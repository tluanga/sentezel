import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/helpers/get_Initial_letter_helper.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/floating_action_button_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:sentezel/settings/ledger_master/new_ledger_master_screen.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/edit_transaction_category/edit_transaction_category_screen.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_category_screen.dart';

import 'package:sentezel/settings/transactionCategory/transaction_category_list_controller.dart';

class TransactionCategoryListScreen extends HookConsumerWidget {
  const TransactionCategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(transactionCategoryListProvider.notifier).loadData();
    }, []);

    final state = ref.watch(transactionCategoryListProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
              title: 'Transaction Category',
              onClose: () {
                Navigator.pop(context);
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Search Ledger'),
                onChanged: (value) {
                  ref.watch(transactionCategoryListProvider.notifier).loadData(
                        searchParam: value,
                      );
                },
              ),
            ),
            state.when(
              data: (data) {
                return _list(context: context, ref: ref, data: data);
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (error, stack) {
                return const Text('Error');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SentezelFloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const NewLedgerMasterScreen(),
          );
        },
      ),
    );
  }

  _list(
      {required BuildContext context,
      required List<TransactionCategory> data,
      required WidgetRef ref}) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _listItem(
            context: context,
            item: data[index],
            ref: ref,
          );
        },
      ),
    );
  }

  _listItem(
      {required BuildContext context,
      required TransactionCategory item,
      required WidgetRef ref}) {
    Color _color = Palette.color3;

    _color = Palette.color1;

    return GestureDetector(
      onTap: () {
        showCupertinoModalBottomSheet(
          expand: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => EditTransactionCategoryScreen(
            transactionCategory: item,
          ),
        );
        // ref
        //     .read(ledgerDetailControllerProvider.notifier)
        //     .loadData(id: item.ledgerId);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const LedgerDetailScreen(),
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  getInitialLetter(item.name),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Center(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        child: item.status == Status.active
                            ? const Text(
                                'Active',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              )
                            : const Text(
                                'In-Active',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
