import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/helpers/dateHelper/financialYear_helper.dart';

class DateSelectionBar extends StatefulWidget {
  final void Function(DateTime startDate, DateTime endDate)? onTap;
  DateSelectionBar({this.onTap});
  @override
  _DateSelectionBarState createState() => _DateSelectionBarState();
}

class _DateSelectionBarState extends State<DateSelectionBar> {
  int valueSelected = 3;
  DateTime startDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day - 7,
  );
  DateTime endDate = DateTime.now();

  void setDate(int value) {
    switch (value) {
      case 1:
        {
          setState(() {
            print('inside 1');
            startDate = DateTime.now().subtract(
              Duration(days: DateTime.now().weekday),
            );
            endDate = DateTime.now();
          });
        }
        break;
      case 2:
        {
          setState(() {
            print('inside 1');
            startDate = new DateTime(endDate.year, endDate.month, 1);
            endDate = DateTime.now();
          });
        }
        break;
      case 3:
        {
          setState(
            () {
              print('inside 1');
              startDate = getStartDateOfAccountingYear();
              endDate = getEndDateOfAccountingYear();
            },
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton(
          value: valueSelected,
          items: [
            DropdownMenuItem(
              child: Text(
                'Tun kar',
                style: TextStyle(color: Colors.black),
              ),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text('Tun thla'),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text('Financial Year'),
              value: 3,
            ),
          ],
          onChanged: (value) {
            // valueSelected = value;
            // setDate(value);
            widget.onTap!(startDate, endDate);
          },
        ),
        Icon(Icons.calendar_today_outlined, size: 15, color: Colors.black),
        Text(
          DateFormat('dd/MM/yyyy').format(startDate),
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        Text(
          'to',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        Text(
          DateFormat('dd/MM/yyyy').format(endDate),
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ],
    );
  }
}
