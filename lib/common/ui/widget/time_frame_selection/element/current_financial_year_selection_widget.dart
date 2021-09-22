import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/helpers/dateHelper/financial_year_helper.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_controller.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_mode_enum.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_state.dart';

class CurrentFinancialYearSelection extends HookConsumerWidget {
  const CurrentFinancialYearSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = getStartDateOfAccountingYear();
    final endDate = getEndDateOfAccountingYear();
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.shade800),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Column(
          children: [
            const Text(
              'Current Financial Year',
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
                Text(
                  DateFormat('dd-MMMM-yyyy').format(startDate),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(timeFrameSelectionControllerProvider.notifier)
                        .setState(
                          TimeFrameSelectionState(
                              startDate: startDate,
                              endDate: endDate,
                              mode: TimeFrameSelectionMode.year),
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
                Text(
                  DateFormat('dd-MMMM-yyyy').format(endDate),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
