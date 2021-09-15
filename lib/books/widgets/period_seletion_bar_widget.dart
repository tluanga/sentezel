import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/period_type_enum.dart';

class PeriodSelectionBarWidget extends HookConsumerWidget {
  const PeriodSelectionBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _period = useState(PeriodType.month);
    return Row(
      children: [
        Row(children: [
          Text(
            EnumToString.convertToString(_period.value),
          ),
          Icon(CupertinoIcons.down_arrow)
        ]),
        Container(
          child: _periodSelection(_period.value),
        ),
      ],
    );
  }

  _periodSelection(_period) {
    switch (_period) {
      case PeriodType.year:
        //Month Selection
        return Row(
          children: [
            Row(
              children: const [Text('Current Financial Year')],
            )
          ],
        );
      case PeriodType.month:
        //To Display Weeks of the month
        return Row(
          children: const [
            Text('Available year of the Current Financial Year'),
            Text('Available month of the selected year'),
          ],
        );
      case PeriodType.week:
        return Row(
          children: const [
            Text('Available year of the Current Financial Year'),
            Text('Available month of the selected year'),
            Text('Display Available week with start date and end date'),
          ],
        );
    }
  }
}
