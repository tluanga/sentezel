import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledgerDetail/ledgerDetail_controller.dart';
import 'package:sentezel/books/ledger/ledgerTransaction/ledgerTransactionDetail_bottomSheet.dart';
import 'package:sentezel/books/ledger/ledgerTransaction/ledgerTransaction_model.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/ledger/ledgerTransaction/transactionDeleteConfirm_bottomSheet.dart';
import 'package:sentezel/books/widgets/dateSelectionBar/dateSelectionBar_widget.dart';
import 'package:sentezel/common/enums/debitOrCredit_enum.dart';

import 'package:sentezel/common/ui/widget/topBar_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LedgerDetailScreen extends HookConsumerWidget {
  final LedgerReport ledgerReport;
  const LedgerDetailScreen({Key? key, required this.ledgerReport})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ledgerDetailControllerProvider);
    useEffect(() {
      ref
          .read(ledgerDetailControllerProvider.notifier)
          .loadData(id: this.ledgerReport.ledgerId);
    }, []);
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              TopBarWidget(
                  title: 'Ledger-${ledgerReport.name}',
                  onClose: () {
                    Navigator.pop(context);
                  }),
              DateSelectionBar(),
              _listHeader(context),
              _list(context: context, ledgerReportData: state),
              _report(data: state),
            ],
          ),
        ),
      ),
    );
  }

  _listHeader(context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            width: size.width * 0.50,
            padding: EdgeInsets.all(15),
            color: Colors.cyan[50],
            child: Text(
              'Particulars',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        VerticalDivider(
          width: 2,
        ),
        Container(
            width: size.width * 0.24,
            padding: EdgeInsets.all(15),
            color: Colors.cyan[50],
            child: Text(
              'Debit',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        VerticalDivider(
          width: 2,
        ),
        Container(
          width: size.width * 0.24,
          padding: EdgeInsets.all(15),
          color: Colors.cyan[50],
          child: Text(
            'Credit',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  _list(
      {required BuildContext context, required LedgerReport ledgerReportData}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.72,
      child: ListView.builder(
        itemCount: this.ledgerReport.ledgerTransaction != null
            ? this.ledgerReport.ledgerTransaction!.length
            : 0,
        itemBuilder: (context, index) {
          return _listItem(
            context,
            ledgerReportData.ledgerTransaction![index],
          );
        },
      ),
    );
  }

//       child:

  _listItem(BuildContext context, LedgerTransaction data) {
    Size size = MediaQuery.of(context).size;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: [
        IconSlideAction(
          caption: 'View Detail',
          color: Colors.blue,
          icon: Icons.wrap_text,
          onTap: () => {
            showModalBottomSheet(
              context: context,
              builder: (context) => LedgerTransactionDetailBottomSheet(
                ledgerTransaction: data,
              ),
            )
          },
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red.shade300,
          icon: Icons.delete,
          onTap: () => {
            showModalBottomSheet(
              context: context,
              builder: (context) => TransactionDeleteConfirmBottomSheet(
                  transactionId: data.transaction!.id!,
                  ledgerId: this.ledgerReport.ledgerId),
            )
          },
        )
      ],
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        width: size.width * 0.50,
                        child: Text(
                          data.transaction!.particular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.24,
                        child: Text(
                          data.debitOrCredit == DebitOrCredit.debit
                              ? data.amount.toString()
                              : '',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.24,
                        child: Text(
                          data.debitOrCredit == DebitOrCredit.credit
                              ? data.amount.toString()
                              : '',
                        ),
                      ),
                    ],
                  )),
              Divider(),
            ],
          )
        ],
      ),
    );
  }

  _report({required LedgerReport data}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      // this is mock data for total
      height: 70,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.green.shade200),
                child: Row(
                  children: [
                    Text('Debit:'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          data.debitAmount.toString(),
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.red.shade200),
                child: Row(
                  children: [
                    Text('Credit:'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          this.ledgerReport.creditAmount.toString(),
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text('Balance:'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: (data.debitAmount - data.creditAmount >= 0)
                              ? Colors.green.shade200
                              : Colors.red.shade200,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            (data.debitAmount - data.creditAmount).toString(),
                            // (model.debit - model.credit).toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Generate PDF'),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Generate EXCEL')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
