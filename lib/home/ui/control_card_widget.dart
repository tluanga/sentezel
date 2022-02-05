import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/analytics/controller/analytics_controller.dart';
import 'package:sentezel/books/books_screen.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/widget/elevated_card_widget.dart';
import 'package:sentezel/new_transaction/new_transaction_Center_screen.dart';

class HomeControlCard extends HookConsumerWidget {
  final double width = 0.28;
  final double height = 0.2;
  const HomeControlCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        //Books
        GestureDetector(
          onTap: () {
            showCupertinoModalBottomSheet(
              isDismissible: true,
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const BooksScreen(),
            );
          },
          child: Stack(
            children: [
              ElevatedCard(
                height: height,
                width: width,
              ),
              const Positioned(
                left: 50,
                bottom: 110,
                child: Text('Books',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Positioned(
                left: 40,
                bottom: 20,
                child: SizedBox(
                  height: 70,
                  width: 60,
                  child: Image.asset(
                    'assets/icons/accounting.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        //--------Analytics--------
        GestureDetector(
          onTap: () {
            ref.read(analyticsControllerProvider.notifier).loadData();
            Navigator.pushNamed(context, RouteConstant.analytics);
          },
          child: Stack(
            children: [
              ElevatedCard(
                height: height,
                width: width,
              ),
              const Positioned(
                left: 35,
                bottom: 110,
                child: Text('Analytics',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Positioned(
                left: 40,
                bottom: 20,
                child: SizedBox(
                  height: 70,
                  width: 60,
                  child: Image.asset(
                    'assets/icons/bar_chart.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        //---New Transaction----------

        GestureDetector(
          onTap: () {
            showCupertinoModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const NewTranscationCenterScreen(),
            );
          },
          child: Stack(
            children: [
              ElevatedCard(
                height: height,
                width: width,
              ),
              const Positioned(
                left: 55,
                bottom: 110,
                child: Text('New',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const Positioned(
                left: 28,
                bottom: 90,
                child: Text('Transaction',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Positioned(
                left: 40,
                bottom: 20,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    'assets/icons/add.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
