import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeekSelection extends HookConsumerWidget {
  const WeekSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade500),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Column(
          children: [
            const Text(
              'Week',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _periodSelection(
                    context: context, label: 'Select Year', width: 30),
                _periodSelection(
                    context: context, label: 'Select Month', width: 32),
                _periodSelection(
                    context: context, label: 'Select Week', width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _periodSelection({
    required BuildContext context,
    required String label,
    required width,
  }) {
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

        // model.startDate = date!;
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * width / 100,
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
              // DateFormat('d-MM-y ').format(
              //   DateTime.now().subtract(
              //     Duration(days: 1),
              //   ),
              label,

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
