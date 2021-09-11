// -------------Selection of  Month------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

monthSelection({
  required BuildContext context,
  required var startDate,
  required var endDate,
  required Function(DateTime) onStartDateSelect,
  required Function(DateTime) onEndDateSelect,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            //open Date Seletor
            var date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime.now(),
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
                  'Select Year',
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
              lastDate: DateTime.now(),
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
                  'Select Month',
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
