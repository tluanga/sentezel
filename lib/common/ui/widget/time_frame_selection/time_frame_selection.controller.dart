import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/helpers/dateHelper/financial_year_helper.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_state.dart';

final timeFrameSelectionControllerProvider = StateNotifierProvider<
    TimeFrameSelectionController,
    TimeFrameSelectionState>((ref) => TimeFrameSelectionController());

class TimeFrameSelectionController
    extends StateNotifier<TimeFrameSelectionState> {
  TimeFrameSelectionController()
      : super(
          TimeFrameSelectionState(
            startDate: DateTime.now(),
            endDate: DateTime.now(),
          ),
        );
  setDate(TimeFrameSelectionState newState) {
    state = newState;
  }

  setStateToFinancialYear() async {
    state = state.copyWith(
      startDate: getStartDateOfAccountingYear(),
      endDate: DateTime.now(),
    );
  }
}
