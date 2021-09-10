import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/analytics/ui/analyticsPeriod_enum.dart';
import 'package:sentezel/analytics/ui/widgets/analyticsTimeFrameSelection/elements/daySelection_widget.dart';
import 'package:sentezel/analytics/ui/widgets/analyticsTimeFrameSelection/elements/monthSelection_widget.dart';
import 'package:sentezel/analytics/ui/widgets/analyticsTimeFrameSelection/elements/timeFrameSelection_dialog.dart';
import 'package:sentezel/analytics/ui/widgets/analyticsTimeFrameSelection/elements/weekSelection_widget.dart';
import 'package:sentezel/analytics/ui/widgets/analyticsTimeFrameSelection/elements/yearSelection_widget.dart';

class AnalyticsTimeFrameSelection extends HookConsumerWidget {
  const AnalyticsTimeFrameSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = useState(AnalyticsPeriod.daily);
    final startDate = useState(DateTime.now().subtract(Duration(days: 7)));
    final endDate = useState(DateTime.now());
    print(startDate.value);
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
                    builder: (context) => timeFrame(
                      context: context,
                      onSelect: (period) {
                        print(period);
                        mode.value = period;
                      },
                      period: mode,
                    ),
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
                      mode.value,
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
            if (mode.value == AnalyticsPeriod.daily)
              daySelection(
                context: context,
                onStartDateSelect: (date) => startDate.value = date,
                onEndDateSelect: (date) => endDate.value = date,
                startDate: startDate,
                endDate: endDate,
              ),
            if (mode.value == AnalyticsPeriod.weekly)
              weekSelection(context: context),
            if (mode.value == AnalyticsPeriod.monthly)
              monthSelection(context: context),
            if (mode.value == AnalyticsPeriod.financialYear)
              yearSelection(context: context),
            // _yearSelection(context: context),
          ],
        ),
      ),
    );
  }
}
