import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/analytics/ui/analytics_period_enum.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/current_financial_year_selection_widget.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/day_selection_widget.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/month_selection_widget.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/week_selection_widget.dart';

class TimeFrameSelection extends HookConsumerWidget {
  final Function(DateTime, DateTime) onDateSelected;
  const TimeFrameSelection({Key? key, required this.onDateSelected})
      : super(key: key);

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
                              mode = period;
                            },
                            onDateSelected: (startDate, endDate) {
                              onDateSelected(startDate, endDate);
                            }));
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
                        children: const [
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
                const SizedBox(
                  width: 20,
                ),
                //---Current Selected Period
                Row(
                  children: [
                    const Text(
                      'Current Selected -',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      EnumToString.convertToString(
                        mode,
                        camelCase: true,
                      ),
                      style: const TextStyle(
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

  _timeFrame({
    required BuildContext context,
    required Function(AnalyticsPeriod) onSelect,
    required Function(DateTime, DateTime) onDateSelected,
  }) {
    AnalyticsPeriod _period = AnalyticsPeriod.daily;
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //----DAILY REPORT-----------
            const Text(
              'Select Period',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            DaySelectionWidget(
              onDateSelected: (startDay, endDay) {
                onDateSelected(startDay, endDay);
              },
            ),

            const WeekSelection(),
            const MonthSelection(),
            const CurrentFinancialYearSelection(),
          ],
        ),
      ),
    );
  }
}
