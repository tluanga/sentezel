import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/periodType_enum.dart';

class PeriodSelectionBarWidget extends HookConsumerWidget {
  const PeriodSelectionBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _period = useState(PeriodType.month);
    return Container(
      child: Row(
        children: [
          Container(
            child: Text(
              EnumToString.convertToString(_period.value),
            ),
          ),
          Container(
            child: _periodSelection(_period.value),
          ),
        ],
      ),
    );
  }

  _periodSelection(_period) {
    switch (_period) {
      case PeriodType.year:
        //Month Selection
        return Container(
          child: Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Text('August,2021'),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      case PeriodType.month:
        return Container(
          child: Row(
            children: [],
          ),
        );
      case PeriodType.week:
        return Container(
          child: Row(
            children: [],
          ),
        );
      case PeriodType.month:
        return Container(
          child: Row(
            children: [],
          ),
        );
    }
  }
}
