import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_mode_enum.dart';

part 'time_frame_selection_state.freezed.dart';

@freezed
class TimeFrameSelectionState with _$TimeFrameSelectionState {
  factory TimeFrameSelectionState({
    @Default(TimeFrameSelectionMode.days) mode,
    required DateTime startDate,
    required DateTime endDate,
  }) = _TimeFrameSelectionState;
}
