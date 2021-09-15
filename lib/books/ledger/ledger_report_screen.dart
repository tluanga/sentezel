import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_controller.dart';
import 'package:sentezel/books/ledger/ledger_detail/ledger_detail_controller.dart';
import 'package:sentezel/books/ledger/ledger_detail/ledger_detail_screen.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/common/helpers/CurrrencySeperatorStringFormatter_helper.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

class LedgerReportScreen extends HookConsumerWidget {
  const LedgerReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ledgerControllerProvider);
    useEffect(() {
      ref.watch(ledgerControllerProvider.notifier).loadData();
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
                title: 'Ledger Report',
                onClose: () {
                  Navigator.pop(context);
                }),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Search Ledger'),
                onChanged: (value) {
                  ref.watch(ledgerControllerProvider.notifier).loadData(
                        ledgerName: value,
                      );
                },
              ),
            ),
            state.when(data: (data) {
              return _list(context: context, data: data, ref: ref);
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

  _list(
      {required BuildContext context,
      required List<LedgerReport> data,
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
      required LedgerReport item,
      required WidgetRef ref}) {
    Color _color = Palette.color3;

    _color = Palette.color1;

    return GestureDetector(
      onTap: () {
        ref
            .read(ledgerDetailControllerProvider.notifier)
            .loadData(id: item.ledgerId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LedgerDetailScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Palette.blackGrey,
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
                  item.getInitialLetter(),
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      // decoration: BoxDecoration(
                      //   color: Colors.green.shade200,
                      // ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Text(
                              'Debit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            ':',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          Text(
                            currencySeperatorStringFormatterHelper(
                              item.debitAmount,
                            ),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: const Text(
                              'Credit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            ':',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          Text(
                            currencySeperatorStringFormatterHelper(
                                item.creditAmount),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
