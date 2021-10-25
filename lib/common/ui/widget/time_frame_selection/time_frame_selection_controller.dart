import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_mode_enum.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_state.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_widget.dart';

final timeFrameSelectionControllerProvider = StateNotifierProvider<
    TimeFrameSelectionController,
    TimeFrameSelectionState>((ref) => TimeFrameSelectionController(ref.read));

class TimeFrameSelectionController
    extends StateNotifier<TimeFrameSelectionState> {
  final Reader _read;
  TimeFrameSelectionController(this._read)
      : super(
          TimeFrameSelectionState(
            startDate: DateTime.now().subtract(const Duration(days: 7)),
            endDate: DateTime.now(),
          ),
        );
  setState(TimeFrameSelectionState newState) {
    state = newState;
  }

  setStartDate(DateTime date) {
    state = state.copyWith(startDate: date);
  }

  setEndDate(DateTime date) {
    state = state.copyWith(endDate: date);
  }

  setMode(TimeFrameSelectionMode mode) {
    state = state.copyWith(mode: mode);
  }
}
