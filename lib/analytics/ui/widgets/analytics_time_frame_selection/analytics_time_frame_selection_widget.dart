import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/analytics/ui/analytics_period_enum.dart';
import 'package:sentezel/analytics/ui/widgets/analytics_time_frame_selection/elements/day_selection/day_selection_widget.dart';
import 'package:sentezel/analytics/ui/widgets/analytics_time_frame_selection/elements/month_selection_widget.dart';
import 'package:sentezel/analytics/ui/widgets/analytics_time_frame_selection/elements/time_frame_selection_dialog.dart';
import 'package:sentezel/analytics/ui/widgets/analytics_time_frame_selection/elements/week_selection_widget.dart';
import 'package:sentezel/analytics/ui/widgets/analytics_time_frame_selection/elements/year_selection_widget.dart';
import 'package:sentezel/common/helpers/dateHelper/date_helper.dart';

class AnalyticsTimeFrameSelection extends HookConsumerWidget {
  final Function(DateTime, DateTime) onTimeSelect;
  const AnalyticsTimeFrameSelection(
      {Key? key, required final this.onTimeSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = useState(AnalyticsPeriod.daily);
    final startDate =
        useState(DateTime.now().subtract(const Duration(days: 7)));
    final endDate = useState(DateTime.now());

    useEffect(() {
      if (mode.value == AnalyticsPeriod.financialYear) {
        startDate.value = DateHelper.getStartDateOfAccountingYear();
        endDate.value = DateHelper.getEndDateOfAccountingYear();
      }
    });
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
        child: Row(
          children: [
            daySelection(
              context: context,
              onStartDateSelect: (date) {
                startDate.value = date;
                onTimeSelect(startDate.value, endDate.value);
              },
              onEndDateSelect: (date) {
                endDate.value = date;
                onTimeSelect(startDate.value, endDate.value);
              },
              startDate: startDate,
              endDate: endDate,
            ),

            // _yearSelection(context: context),
          ],
        ),
      ),
    );
  }
}
