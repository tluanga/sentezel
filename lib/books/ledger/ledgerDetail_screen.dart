import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledgerTransactionDetail_bottomSheet.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/widgets/dateSelectionBar/dateSelectionBar_widget.dart';
import 'package:sentezel/books/widgets/periodSeletionBar_widget.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LedgerDetailScreen extends HookConsumerWidget {
  final LedgerReport ledgerReport;
  const LedgerDetailScreen({Key? key, required this.ledgerReport})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              _list(context: context),
              _report(),
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

  _list({required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.76,
      child: Column(
        children: [
          //----List Item----
          _listItem(context),
          _listItem(context),
          _listItem(context),
          _listItem(context),
          _listItem(context),
        ],
      ),
    );
  }

//       child:

  _listItem(BuildContext context) {
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
              builder: (context) => LedgerTransactionDetailBottomSheet(),
            )
          },
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red.shade300,
          icon: Icons.delete,
          onTap: () => () {},
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
                          'Particular',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.24,
                        child: Text(
                          '1000',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.24,
                        child: Text(
                          100.00.abs().toString(),
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

  _report() {
    return Container(
      decoration: BoxDecoration(
        color: Palette.color2,
      ),
      // this is mock data for total
      height: 40,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: [
                    Text('Debit:'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          'a1122',
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text('Credit:'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          'cerdit1111',
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text('Total:'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          '10000',
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
                        // decoration: BoxDecoration(
                        //   color: (model.debit - model.credit >= 0)
                        //       ? Colors.green.shade300
                        //       : Colors.red.shade300,
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        child: Center(
                          child: Text(
                            111.toString(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text('Generate Pdf'),
              ),
              Container(
                child: Text('Generate Excel Sheet'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
