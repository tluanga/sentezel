import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/ui/widget/topBarForConfirmBottomSheet_widget.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';

class JournalDetailModalBottomSheet extends StatelessWidget {
  final Transaction data;
  const JournalDetailModalBottomSheet({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBarForConfirmBottomSheetWidget(
                label: 'Journal', onConfirm: () {}),
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
            Container(
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
                    value: data.transactionTypeId.toString(),
                  ),
                  _field(
                    context: context,
                    label: 'Mode',
                    value: EnumToString.convertToString(data.mode),
                  ),
                ],
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
            width: MediaQuery.of(context).size.width * 0.3,
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
