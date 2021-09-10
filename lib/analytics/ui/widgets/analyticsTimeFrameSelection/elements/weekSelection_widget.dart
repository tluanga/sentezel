import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

weekSelection({required BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.97,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            //open Date Seletor
            // var date = await showDatePicker(
            //   context: context,
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(DateTime.now().year),
            //   lastDate: DateTime.now(),
            // );

            // model.startDate = date!;
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
                  'Year',
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
