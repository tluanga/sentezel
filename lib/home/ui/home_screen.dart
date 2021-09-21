import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/settings_ellipse_widget.dart';
import 'package:sentezel/home/ui/control_card_widget.dart';
import 'package:sentezel/home/ui/header_card_widget.dart';
import 'package:sentezel/home/ui/latest_transaction_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SettingsEllipseWidget(),
              HomeHeaderCard(),
              HomeControlCard(),
              SizedBox(
                height: 10,
              ),
              HomeLatestTransactionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
