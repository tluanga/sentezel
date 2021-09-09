import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/widgets/dateSelectionBar/dateSelectionBar_widget.dart';
import 'package:sentezel/books/widgets/reportTopBar_widget.dart';

class TradingAccountReportScreen extends HookConsumerWidget {
  const TradingAccountReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              ReportTopBarWidget(
                  title: 'Trading Account',
                  onGenerateExcel: () {},
                  onGeneratePdf: () {},
                  onClose: () {}),
              DateSelectionBar()
            ],
          ),
        ),
      ),
    );
  }
}
