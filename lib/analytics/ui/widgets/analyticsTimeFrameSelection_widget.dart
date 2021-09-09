import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/analytics/ui/analyticsPeriod_enum.dart';

class AnalyticsTimeFrameSelection extends HookConsumerWidget {
  const AnalyticsTimeFrameSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AnalyticsPeriod mode = AnalyticsPeriod.weekly;

    return Container(
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(children: [
              GestureDetector(
                onTap: () async {
                  showCupertinoModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => _timeFrame(
                        context: context,
                        onSelect: (period) {
                          print(period);
                          mode = period;
                        }),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.29,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade700),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: [
                        Text(
                          'Select Period',
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
              ),
              SizedBox(
                width: 20,
              ),
              //---Current Selected Period
              Row(
                children: [
                  Text(
                    'Current Selected -',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    EnumToString.convertToString(
                      mode,
                      camelCase: true,
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            if (mode == AnalyticsPeriod.daily)
              _dayWiseSelection(context: context),
            if (mode == AnalyticsPeriod.weekly)
              _weekSelection(context: context),
            if (mode == AnalyticsPeriod.monthly)
              _monthSelection(context: context),
            // _yearSelection(context: context),
          ],
        ),
      ),
    );
  }

  _timeFrame(
      {required BuildContext context,
      required Function(AnalyticsPeriod) onSelect}) {
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
                  groupValue: _period,
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
                  groupValue: _period,
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
                  groupValue: _period,
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
                  value: AnalyticsPeriod.monthly,
                  activeColor: Colors.green.shade500,
                  onChanged: (value) {
                    onSelect(AnalyticsPeriod.monthly);
                    _period = AnalyticsPeriod.monthly;
                    Navigator.pop(context);
                  },
                  groupValue: _period,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _dayWiseSelection({required BuildContext context}) {
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

  _weekSelection({required BuildContext context}) {
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

  // -------------Selection of  Month------------------------
  _monthSelection({required BuildContext context}) {
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

  _yearSelection({required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
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
        ],
      ),
    );
  }
}
