import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/helpers/dateHelper/date_helper.dart';

weekSelection({
  required BuildContext context,
  required var startDate,
  required var endDate,
  required Function(DateTime) onStartDateSelect,
  required Function(DateTime) onEndDateSelect,
}) {
  int _startingYear = DateHelper.getStartDateOfAccountingYear().year;
  int _endingYear = DateHelper.getEndDateOfAccountingYear().year;
  int _year =
      DateTime.now().year == _startingYear ? _startingYear : _endingYear;

  List<String> _startingYearMonths = [
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<String> _endingYearMonths = [
    'January',
    'February',
    'March',
  ];

  return Container(
    width: MediaQuery.of(context).size.width * 0.97,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            showCupertinoModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => Material(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      Container(
                        child: ListTile(
                          title: Text(
                            _startingYear.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Radio(
                            value: _startingYear,
                            activeColor: Colors.green.shade500,
                            onChanged: (value) {
                              _year = _startingYear;
                              onStartDateSelect(DateTime(_year));
                              Navigator.pop(context);
                            },
                            groupValue: startDate.value.year,
                          ),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(
                            _endingYear.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Radio(
                            value: _endingYear,
                            activeColor: Colors.green.shade500,
                            onChanged: (value) {
                              _year = _endingYear;
                              onStartDateSelect(DateTime(_year));

                              Navigator.pop(context);
                            },
                            groupValue: startDate.value.year,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
                Text(
                  startDate.value.year.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 16,
                )
              ],
            ),
          ),
        ),
        //-------------------MONTH SELECTION--------------
        GestureDetector(
          onTap: () async {
            //--------Calculate available month according to the selection---
            List _selectedList = startDate.value.year == _startingYear
                ? _startingYearMonths
                : _endingYearMonths;
            showCupertinoModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => Material(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    itemCount: _selectedList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        child: ListTile(
                          title: Text(
                            _selectedList[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Radio(
                            value: _endingYear,
                            activeColor: Colors.green.shade500,
                            onChanged: (value) {
                              onStartDateSelect(DateTime(
                                _year,
                              ));
                              Navigator.pop(context);
                            },
                            groupValue: _year,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
                Text(
                  'December',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 18,
                )
              ],
            ),
          ),
        ),

        //-----WEEK SELECTION-----------
        GestureDetector(
          onTap: () async {
            //open Date Seletor
            var date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime.now(),
            );
            // Provider.of<AnalyticsProvider>(context, listen: false).endDate =
            //     date!;
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
                Text(
                  'Week',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 18,
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
