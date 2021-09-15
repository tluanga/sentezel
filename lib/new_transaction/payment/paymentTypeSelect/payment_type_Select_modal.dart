// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/helpers/getInitialLetter_helper.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';
import 'package:sentezel/new_transaction/payment/paymentTypeSelect/payment_type_Select_controller.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';

class PaymentTypeSelectModal extends HookConsumerWidget {
  final Function(TransactionCategory) onSelect;
  const PaymentTypeSelectModal({Key? key, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentTypeSelectControllerProvider);
    useEffect(() {
      ref.watch(paymentTypeSelectControllerProvider.notifier).loadData();
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarForBottomSheetWidget(
                label: 'Please Select Category',
                onExit: () {
                  Navigator.pop(context);
                }),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Search Ledger'),
                onChanged: (value) {
                  ref
                      .watch(paymentTypeSelectControllerProvider.notifier)
                      .loadData(
                        categoryName: value,
                      );
                },
              ),
            ),
            state.when(data: (data) {
              return _list(context, data);
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, error: (error, stack) {
              return const Center(
                child: Text('Error'),
              );
            }),
          ],
        ),
      ),
    );
  }

  _list(context, data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _listItem(
            context: context,
            item: data[index],
          );
        },
      ),
    );
  }

  _listItem(
      {required BuildContext context, required TransactionCategory item}) {
    Color _color = Palette.color3;

    _color = Palette.color1;

    return GestureDetector(
      onTap: () {
        onSelect(item);
        Navigator.pop(context);
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
                      ),
                    ),
                  ),
                ),
                Text(
                  item.description,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
