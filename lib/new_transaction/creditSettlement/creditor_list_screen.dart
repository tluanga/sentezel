import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/helpers/CurrrencySeperatorStringFormatter_helper.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';
import 'package:sentezel/new_transaction/creditSettlement/creditor_list_controller.dart';
import 'package:sentezel/new_transaction/creditSettlement/settlement/credit_settlement_screen.dart';

class CreditorListScreen extends HookConsumerWidget {
  const CreditorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(creditorListControllerProvider);
    useEffect(() {
      ref.read(creditorListControllerProvider.notifier).loadData();
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarForBottomSheetWidget(
              label: 'Creditor List',
              onExit: () {
                Navigator.pop(context);
              },
            ),
            state.when(
              data: (data) {
                return Container(
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreditSettlementScreen(
                                  creditor: data[index],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      data[index].party!.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text(
                                      currencySeperatorStringFormatterHelper(
                                          data[index].amount),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Settle',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey.shade600,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (error, stack) {
                return Text('Error');
              },
            ),
          ],
        ),
      ),
    );
  }
}
