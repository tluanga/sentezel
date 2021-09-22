import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection.controller.dart';

class DaySelectionWidget extends HookConsumerWidget {
  const DaySelectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timeFrameSelectionControllerProvider);
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade500),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //StartDate-
            _dateSelection(
                context: context,
                initialDate: state.startDate,
                onDateSelected: (date) {
                  ref
                      .read(timeFrameSelectionControllerProvider.notifier)
                      .setDate(state.copyWith(startDate: date));
                }),
            //-EndDates
            _dateSelection(
              context: context,
              initialDate: state.endDate,
              onDateSelected: (date) {
                ref
                    .read(timeFrameSelectionControllerProvider.notifier)
                    .setDate(state.copyWith(endDate: date));
              },
            ),
          ],
        ),
      ),
    );
  }

  _dateSelection({
    required BuildContext context,
    required DateTime initialDate,
    required Function(DateTime) onDateSelected,
  }) {
    return GestureDetector(
      onTap: () async {
        //open Date Seletor

        final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(DateTime.now().year),
          lastDate: DateTime.now().add(
            const Duration(
              days: 100,
            ),
          ),
        );
        onDateSelected(date!);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.calendar_today,
              size: 20,
            ),
            Text(
              DateFormat('d-MM-y ').format(initialDate),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_down,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
