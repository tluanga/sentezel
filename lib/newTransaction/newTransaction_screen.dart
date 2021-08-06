import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/moneyInputField_widget.dart';
import 'package:sentezel/common/ui/widget/topBarNewItem_widget.dart';

class NewTransactionScreen extends StatelessWidget {
  const NewTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TopBarNewItemWidget(
                title: 'New Transaction',
                onSave: () {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: MoneyInputField(label: 'Amount'),
            ),
          ],
        ),
      ),
    );
  }
}
