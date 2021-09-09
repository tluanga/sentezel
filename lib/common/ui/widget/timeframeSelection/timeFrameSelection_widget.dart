import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/analytics/ui/analyticsPeriod_enum.dart';
import 'package:sentezel/common/ui/widget/timeframeSelection/element/currentFinancialYearSelection_widget.dart';
import 'package:sentezel/common/ui/widget/timeframeSelection/element/daySelection_widget.dart';
import 'package:sentezel/common/ui/widget/timeframeSelection/element/monthSelection_widget.dart';
import 'package:sentezel/common/ui/widget/timeframeSelection/element/weekSelection_widget.dart';

class TimeFrameSelection extends HookConsumerWidget {
  const TimeFrameSelection({Key? key}) : super(key: key);

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
            Row(
              children: [
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
              ],
            ),
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
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //----DAILY REPORT-----------
            Text(
              'Select Period',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            DaySelectionWidget(),

            WeekSelection(),
            MonthSelection(),
            CurrentFinancialYearSelection(),
          ],
        ),
      ),
    );
  }
}
