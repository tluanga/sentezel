import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

class TransactionCategoryScreen extends StatelessWidget {
  const TransactionCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
              title: 'Transaction Category',
              onClose: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
