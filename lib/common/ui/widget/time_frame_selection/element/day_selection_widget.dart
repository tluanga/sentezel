import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_controller.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_mode_enum.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_state.dart';

class DaySelectionWidget extends HookConsumerWidget {
  const DaySelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(timeFrameSelectionControllerProvider);
    final startDate = useState(state.startDate);
    final endDate = useState(state.endDate);
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Day',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Start Date--
                _dateSelection(
                  context: context,
                  onDateSelected: (date) {
                    startDate.value = date;
                  },
                  initialDate: startDate.value,
                ),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(timeFrameSelectionControllerProvider.notifier)
                        .setState(
                          TimeFrameSelectionState(
                              startDate: startDate.value,
                              endDate: endDate.value,
                              mode: TimeFrameSelectionMode.days),
                        );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: const BoxDecoration(
                      color: Colors.amberAccent,
                    ),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                //End Date---
                _dateSelection(
                  context: context,
                  onDateSelected: (date) {
                    endDate.value = date;
                  },
                  initialDate: endDate.value,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _dateSelection(
      {required BuildContext context,
      required Function(DateTime) onDateSelected,
      required DateTime initialDate}) {
    return GestureDetector(
      onTap: () async {
        //open Date Seletor
        DateTime? date = await showDatePicker(
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
        // model.startDate = date!;
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
