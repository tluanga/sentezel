import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/books/journal/journal_model.dart';
import 'package:sentezel/common/ui/widget/topBarForBottomSheet_widget.dart';

class JournalDetailModalBottomSheet extends StatelessWidget {
  final Journal data;
  const JournalDetailModalBottomSheet({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBarForBottomSheetWidget(
              label: 'Journal',
              onExit: () {
                Navigator.pop(context);
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              decoration: BoxDecoration(color: Colors.redAccent[100]),
              child: Center(
                child: Text(
                  'Transaction Detail',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Container(
                child: Column(
                  children: [
                    _field(
                      context: context,
                      label: 'Particular',
                      value: data.particular,
                    ),
                    _field(
                      context: context,
                      label: 'Date',
                      value: DateFormat('dd-MM-yyyy hh:mm a').format(data.date),
                    ),
                    _field(
                      context: context,
                      label: 'Amount',
                      value: data.amount.toString(),
                    ),
                    _field(
                      context: context,
                      label: 'Transaction Type',
                      value: data.transactionCategory,
                    ),
                    _field(
                      context: context,
                      label: 'Mode',
                      value: data.mode,
                    ),
                    data.partyLedgerName!.isNotEmpty
                        ? _field(
                            context: context,
                            label: 'Party',
                            value: data.partyLedgerName!,
                          )
                        : Container(),
                    data.assetLedgerName!.isNotEmpty
                        ? _field(
                            context: context,
                            label: 'Asset',
                            value: data.assetLedgerName!,
                          )
                        : Container(),
                    data.creditSideLedgerName!.isNotEmpty
                        ? _field(
                            context: context,
                            label: 'Credit Side',
                            value: data.creditSideLedgerName!,
                          )
                        : Container(),
                    data.debitSideLedgerName!.isNotEmpty
                        ? _field(
                            context: context,
                            label: 'Debit Side',
                            value: data.debitSideLedgerName!,
                          )
                        : Container()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _field(
      {required BuildContext context,
      required String label,
      required String value}) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              ':',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.63,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
