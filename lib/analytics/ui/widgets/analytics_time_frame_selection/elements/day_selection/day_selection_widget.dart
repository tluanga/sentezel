import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

daySelection({
  required BuildContext context,
  required var startDate,
  required var endDate,
  required Function(DateTime) onStartDateSelect,
  required Function(DateTime) onEndDateSelect,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.92,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Start Date',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '-',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
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
                onStartDateSelect(date!);

                // model.startDate = date!;
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                  ),
                  Text(
                    DateFormat('d-MM-yyyy').format(startDate.value),
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
          ],
        ),

        //--------------------------------------
        Row(
          children: [
            const Text(
              'End Date',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '-',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
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
                onEndDateSelect(date!);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                  ),
                  Text(
                    DateFormat('d-MM-yyyy').format(endDate.value),
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
          ],
        ),
      ],
    ),
  );
}
