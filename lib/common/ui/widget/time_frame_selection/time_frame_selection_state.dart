class TimeFrameSelectionState {
  DateTime startDate;
  DateTime endDate;

  TimeFrameSelectionState({
    required this.startDate,
    required this.endDate,
  });

  TimeFrameSelectionState copyWith({
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return TimeFrameSelectionState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
