import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/books/journal/journal_controller.dart';
import 'package:sentezel/books/journal/journal_detail_bottomsheet.dart';
import 'package:sentezel/books/journal/journal_model.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:sentezel/common/helpers/get_transaction_color_helper.dart';
import 'package:sentezel/common/helpers/get_transaction_icon_helper.dart';
import 'package:sentezel/common/ui/pallete.dart';

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
        return _list(context, data);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Text(error.toString()),
    );
  }

  _list(BuildContext context, List<Journal> list) {
    list.sort((a, b) => a.date.compareTo(b.date));

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItem(
              context: context, item: list[index], onSelect: (item) {});
        },
      ),
    );
  }

  _listItem(
      {required BuildContext context,
      required Journal item,
      required Function(Journal) onSelect}) {
    Color _color = Palette.color3;
    final _icon = getTransactionIcon(item.transactionType);
    _color = Palette.color1;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => JournalDetailModalBottomSheet(
            data: item,
          ),
        );
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
                color: getTransactionColor(item.transactionType),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Icon(
                _icon,
                size: 52,
              ),
            ),
            // Icon(getTransactionIcon(item.transactionType)),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.20,
                            child: Text(
                              DateFormat('dd-MM-yyyy').format(item.date),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              item.particular,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: const Text(
                              'Amount',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.17,
                            child: Text(
                              currencySeperatorStringFormatterHelper(
                                  item.amount),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Text(
                              item.mode,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
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
