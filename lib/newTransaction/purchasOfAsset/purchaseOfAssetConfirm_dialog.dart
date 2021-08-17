import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/topBarForConfirmBottomSheet_widget.dart';

purchaseOfAssetConfirmDialog(BuildContext context) {
  return Material(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          TopBarForConfirmBottomSheetWidget(
            label: 'Confirm Transaction',
            onConfirm: () {},
          ),
          SizedBox(
            child: Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Text('Particular'),
                    ),
                    TableCell(
                      child: Text('Amount'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
