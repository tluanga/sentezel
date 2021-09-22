import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/analytics/ui/analytics_period_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/current_financial_year_selection_widget.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/day_selection_widget.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/month_selection_widget.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/week_selection_widget.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_controller.dart';

class TimeFrameSelection extends HookConsumerWidget {
  const TimeFrameSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timeFrameSelectionControllerProvider);
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
                      builder: (context) =>
                          _timeFrame(context: context, onSelect: (period) {}),
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
                Column(
                  children: [
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
                            state.mode,
                            camelCase: true,
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            DateFormat('dd-MMM-yy').format(state.startDate),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: const Text('-')),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            DateFormat('dd-MMM-yy').format(state.endDate),
                          ),
                        ),
                      ],
                    ),
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
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //----DAILY REPORT-----------
            InkWell(
              splashColor: Palette.color3,
              focusColor: Palette.color3,
              highlightColor: Palette.color5,
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Center(
                  child: Text(
                    'Confirm Period Selected',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            //

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
