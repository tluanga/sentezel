import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/pallete.dart';

sentezelBookAppBar({
  required BuildContext context,
  required String iconPath,
  required String title,
  required Function generateExcel,
  required Function generatePdf,
  required String iconAnimationLabel,
}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        generateExcel();
        Navigator.pop(context);
      },
      child: Container(
        child: Image.asset(
          'assets/icons/icon_back.png',
          color: Colors.grey.shade500,
        ),
      ),
    ),
    title: Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Hero(
              tag: 'SentezelAnimationTag.transactionSell',
              child: Image.asset('assets/icons/shop_sell.png'),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Palette.textColor,
              ),
            ),
          ],
        ),
      ),
    ),
    elevation: 0,
    actions: [
      Center(
        child: InkWell(
          onTap: () {
            generatePdf();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.1,
            child: Center(
              child: Image.asset('assets/icons/excel.png'),
            ),
          ),
        ),
      ),
      Center(
        child: InkWell(
          onTap: () {
            generatePdf();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.1,
            child: Center(
              child: Image.asset('assets/icons/pdf.png'),
            ),
          ),
        ),
      ),
    ],
  );
}
