import 'package:flutter/material.dart';
import 'package:sentezel/analytics/ui/analytics_period_enum.dart';

timeFrame({
  required BuildContext context,
  required Function(AnalyticsPeriod) onSelect,
  required var period,
}) {
  return Material(
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          ListTile(
            title: const Text(
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

                Navigator.pop(context);
              },
              groupValue: period.value,
            ),
          ),
          ListTile(
            title: const Text(
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
                Navigator.pop(context);
              },
              groupValue: period.value,
            ),
          ),
          ListTile(
            title: const Text(
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

                Navigator.pop(context);
              },
              groupValue: period.value,
            ),
          ),
          ListTile(
            title: const Text(
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
        ],
      ),
    ),
  );
}
