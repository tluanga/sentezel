import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_detail/ledger_detail_controller.dart';
import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_detail_bottom_sheet.dart';
import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_model.dart';
import 'package:sentezel/books/ledger/ledger_transaction/transaction_delete_confirm_bottomSheet.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:sentezel/common/ui/widget/excel_export_button_widget.dart';
import 'package:sentezel/common/ui/widget/pdf_export_button_widget.dart';

import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/common/enums/debit_or_credit_enum.dart';

import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_widget.dart';

import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LedgerDetailScreen extends HookConsumerWidget {
  const LedgerDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ledgerDetailControllerProvider);
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
              title: 'Ledger-${state.name}',
              onClose: () {
                Navigator.pop(context);
              },
            ),
            const TimeFrameSelection(),
            const SizedBox(
              height: 10,
            ),
            _listHeader(context),
            _list(context: context, ledgerReportData: state),
            _report(data: state, context: context),
          ],
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
            padding: const EdgeInsets.all(15),
            color: Colors.cyan[50],
            child: const Text(
              'Particulars',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        const VerticalDivider(
          width: 2,
        ),
        Container(
            width: size.width * 0.24,
            padding: const EdgeInsets.all(15),
            color: Colors.cyan[50],
            child: const Text(
              'Debit',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        const VerticalDivider(
          width: 2,
        ),
        Container(
          width: size.width * 0.24,
          padding: const EdgeInsets.all(15),
          color: Colors.cyan[50],
          child: const Text(
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
    return SizedBox(
      height: size.height * 0.575,
      child: ListView.builder(
        itemCount: ledgerReportData.ledgerTransaction != null
            ? ledgerReportData.ledgerTransaction!.length
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
      actionPane: const SlidableDrawerActionPane(),
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
        // IconSlideAction(
        //   caption: 'Edit',
        //   color: Colors.purple,
        //   icon: Icons.edit,
        //   onTap: () => {

        //     showModalBottomSheet(
        //       context: context,
        //       builder: (context) => LedgerTransactionDetailBottomSheet(
        //         ledgerTransaction: data,
        //       ),
        //     )
        //   },
        // ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red.shade300,
          icon: Icons.delete,
          onTap: () => {
            showModalBottomSheet(
              context: context,
              builder: (context) => TransactionDeleteConfirmBottomSheet(
                transactionId: data.transaction!.id!,
              ),
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                              ? currencySeperatorStringFormatterHelper(
                                  data.amount)
                              : '',
                        ),
                      ),
                    ],
                  )),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }

  _report({required LedgerReport data, required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      // this is mock data for total
      height: MediaQuery.of(context).size.height * 0.1,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(color: Colors.green.shade200),
                child: Row(
                  children: [
                    const Text('Debit:'),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          currencySeperatorStringFormatterHelper(
                              data.debitAmount),
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(color: Colors.red.shade200),
                child: Row(
                  children: [
                    const Text('Credit:'),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          currencySeperatorStringFormatterHelper(
                              data.creditAmount),
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text('Bal:'),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 20,
                      decoration: BoxDecoration(
                        color: (data.debitAmount - data.creditAmount >= 0)
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          currencySeperatorStringFormatterHelper(
                              data.debitAmount - data.creditAmount),
                          // (model.debit - model.credit).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerRight),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PDFExportButton(),
                ExcelExportButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
