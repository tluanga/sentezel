import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/books/balanceSheet/balanceSheetReport_screen.dart';
import 'package:sentezel/books/journal/journalReport_screen.dart';
import 'package:sentezel/books/ledger/ledger_report_screen.dart';
import 'package:sentezel/books/profit_and_loss/profit_and_loss_report_screen.dart';
import 'package:sentezel/books/trial_balance/trial_balance_report_screen.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/pallete.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          color: Palette.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: _item(
                      context: context,
                      label: 'Journal',
                      icon: CupertinoIcons.grid,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JournalReportScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  _item(
                    context: context,
                    label: 'Ledger',
                    icon: CupertinoIcons.circle_grid_3x3,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LedgerReportScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: _item(
                      context: context,
                      label: 'Trial Balance',
                      icon: CupertinoIcons.equal_square,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TrialBalanceReportScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  _item(
                    context: context,
                    label: 'Trading Account',
                    icon: CupertinoIcons.layers,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => TradingAccountReportScreen(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: _item(
                      context: context,
                      label: 'Profit & Loss',
                      icon: CupertinoIcons.rectangle_3_offgrid,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProfitAndLossReportScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  _item(
                    context: context,
                    label: 'Balance Sheet',
                    icon: CupertinoIcons.layers_alt,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BalanceSheetReportScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _close(
                    context: context,
                    label: 'Close ',
                    icon: CupertinoIcons.xmark,
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          RouteConstant.home, ModalRoute.withName('/'));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _item(
      {required BuildContext context,
      required String label,
      required IconData icon,
      required Function onTap}) {
    double height = MediaQuery.of(context).size.height * 0.2;
    double width = MediaQuery.of(context).size.width * 0.4;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              icon,
              size: 40,
            )
          ],
        ),
      ),
    );
  }

  _close(
      {required BuildContext context,
      required String label,
      required IconData icon,
      required Function onTap}) {
    double height = MediaQuery.of(context).size.height * 0.14;
    double width = MediaQuery.of(context).size.width * 0.25;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
