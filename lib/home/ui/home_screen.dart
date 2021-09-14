import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/settingsEllipse_widget.dart';
import 'package:sentezel/home/ui/controlCard_widget.dart';
import 'package:sentezel/home/ui/headerCard_widget.dart';
import 'package:sentezel/home/ui/latestTransaction_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
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
      ),
    );
  }
}
