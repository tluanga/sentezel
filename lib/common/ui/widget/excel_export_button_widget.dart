import 'package:flutter/material.dart';

class ExcelExportButton extends StatelessWidget {
  const ExcelExportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.41,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.07,
              child: Image.asset('assets/icons/excel.png'),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('Export to Excel File')
          ],
        ),
      ),
    );
  }
}
