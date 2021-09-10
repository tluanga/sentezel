import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

daySelection({required BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.97,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
                  DateFormat('d-MM-y ').format(DateTime.now()),
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
        GestureDetector(
          onTap: () async {
            //open Date Seletor
            var date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime.now().add(
                Duration(
                  days: 100,
                ),
              ),
            );
            // Provider.of<AnalyticsProvider>(context, listen: false).endDate =
            //     date!;
          },
          child: Container(
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
                Text(
                  DateFormat('d-MM-y ').format(DateTime.now()),
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
