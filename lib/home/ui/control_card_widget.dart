import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/books/books_screen.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/widget/elevated_card_widget.dart';
import 'package:sentezel/new_transaction/new_transaction_Center_screen.dart';

class HomeControlCard extends StatelessWidget {
  final double width = 0.28;
  final double height = 0.2;
  const HomeControlCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          //Books
          GestureDetector(
            onTap: () {
              showCupertinoModalBottomSheet(
                isDismissible: true,
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => BooksScreen(),
              );
            },
            child: Stack(
              children: [
                ElevatedCard(
                  height: height,
                  width: width,
                ),
                Positioned(
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
                  child: Container(
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
              Navigator.pushNamed(context, RouteConstant.analytics);
            },
            child: Stack(
              children: [
                ElevatedCard(
                  height: height,
                  width: width,
                ),
                Positioned(
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
                  child: Container(
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
                builder: (context) => NewTranscationCenterScreen(),
              );
            },
            child: Stack(
              children: [
                ElevatedCard(
                  height: height,
                  width: width,
                ),
                Positioned(
                  left: 55,
                  bottom: 110,
                  child: Text('New',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Positioned(
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
                  child: Container(
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
      ),
    );
  }
}
