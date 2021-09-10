import 'package:flutter/material.dart';
import 'package:sentezel/analytics/ui/analyticsPeriod_enum.dart';

timeFrame({
  required BuildContext context,
  required Function(AnalyticsPeriod) onSelect,
  required var period,
}) {
  AnalyticsPeriod _period = AnalyticsPeriod.daily;
  return Material(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          Container(
            child: ListTile(
              title: Text(
                'Day',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Radio(
                value: AnalyticsPeriod.daily,
                activeColor: Colors.green.shade500,
                onChanged: (value) {
                  onSelect(AnalyticsPeriod.daily);
                  _period = AnalyticsPeriod.daily;
                  Navigator.pop(context);
                },
                groupValue: period.value,
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                'Week ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Radio(
                value: AnalyticsPeriod.weekly,
                activeColor: Colors.green.shade500,
                onChanged: (value) {
                  onSelect(AnalyticsPeriod.weekly);
                  _period = AnalyticsPeriod.weekly;
                  Navigator.pop(context);
                },
                groupValue: period.value,
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                'Month',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Radio(
                value: AnalyticsPeriod.monthly,
                activeColor: Colors.green.shade500,
                onChanged: (value) {
                  onSelect(AnalyticsPeriod.monthly);
                  _period = AnalyticsPeriod.monthly;
                  Navigator.pop(context);
                },
                groupValue: period.value,
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                'Current Financial Year',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Radio(
                value: AnalyticsPeriod.financialYear,
                activeColor: Colors.green.shade500,
                onChanged: (value) {
                  onSelect(AnalyticsPeriod.financialYear);
                  Navigator.pop(context);
                },
                groupValue: period.value,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
