import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

daySelection({
  required BuildContext context,
  required var startDate,
  required var endDate,
  required Function(DateTime) onStartDateSelect,
  required Function(DateTime) onEndDateSelect,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.97,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              child: Text(
                'Start Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                //open Date Seletor
                DateTime? date = DateTime.now();
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime.now().add(
                    Duration(
                      days: 100,
                    ),
                  ),
                );
                onStartDateSelect(date!);

                // model.startDate = date!;
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 20,
                    ),
                    Text(
                      DateFormat('d-MM-yyyy').format(startDate.value),
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
          ],
        ),

        //--------------------------------------
        Row(
          children: [
            Container(
              child: Text(
                'End Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                //open Date Seletor
                DateTime? date = DateTime.now();
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime.now().add(
                    Duration(
                      days: 100,
                    ),
                  ),
                );
                onEndDateSelect(date!);
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 20,
                    ),
                    Text(
                      DateFormat('d-MM-yyyy').format(endDate.value),
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
          ],
        ),
      ],
    ),
  );
}
