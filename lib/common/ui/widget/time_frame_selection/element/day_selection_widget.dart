import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection.controller.dart';

class DaySelectionWidget extends HookConsumerWidget {
  final Function(DateTime, DateTime) onDateSelected;
  const DaySelectionWidget({
    Key? key,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade500),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            const Text(
              'Day',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //StartDate-
                _dateSelection(
                    context: context,
                    onDateSelected: (date) {
                      final state =
                          ref.read(timeFrameSelectionControllerProvider);
                      ref
                          .read(timeFrameSelectionControllerProvider.notifier)
                          .setDate(state.copyWith(startDate: date));
                    }),
                _dateSelection(
                    context: context,
                    onDateSelected: (date) {
                      final state =
                          ref.read(timeFrameSelectionControllerProvider);
                      ref
                          .read(timeFrameSelectionControllerProvider.notifier)
                          .setDate(state.copyWith(startDate: date));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _dateSelection(
      {required BuildContext context,
      required Function(DateTime) onDateSelected}) {
    return GestureDetector(
      onTap: () async {
        //open Date Seletor
        DateTime? date = DateTime.now();
        date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year),
          lastDate: DateTime.now().add(
            const Duration(
              days: 100,
            ),
          ),
        );
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
              DateFormat('d-MM-y ').format(
                DateTime.now().subtract(
                  const Duration(days: 1),
                ),
              ),
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
