import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/books/journal/journal_controller.dart';
import 'package:sentezel/books/journal/journal_model.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:sentezel/common/helpers/get_transaction_icon_helper.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

class HomeLatestTransactionWidget extends HookConsumerWidget {
  const HomeLatestTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(journalControllerProvider.notifier).loadData();
    }, []);
    AsyncValue<List<Journal>> state = ref.watch(journalControllerProvider);
    return state.when(
      data: (data) {
        return _list(context, data, ref);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Text(error.toString()),
    );
  }

  _list(BuildContext context, List<Journal> list, WidgetRef ref) {
    list.sort((a, b) => a.date.compareTo(b.date));

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItem(
            context: context,
            item: list[index],
            onSelect: (item) {},
          );
        },
      ),
    );
  }

  _listItem({
    required BuildContext context,
    required Journal item,
    required Function(Journal) onSelect,
  }) async {
    Color _color = Palette.color3;

    _color = Palette.color1;

    return Container(
      margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
      height: MediaQuery.of(context).size.height * 0.05,
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
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            // Icon(getTransactionIcon(item.transactionType)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd-MMMM-yyy').format(item.date),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  currencySeperatorStringFormatterHelper(item.amount),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(item.particular),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
