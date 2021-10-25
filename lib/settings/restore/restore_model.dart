class Restore {
  bool backupFileIsPicked;
  String backupFilePath;
  Restore({
    required this.backupFileIsPicked,
    required this.backupFilePath,
  });

  Restore copyWith({
    bool? backupFileIsPicked,
    String? backupFilePath,
  }) {
    return Restore(
      backupFileIsPicked: backupFileIsPicked ?? this.backupFileIsPicked,
      backupFilePath: backupFilePath ?? this.backupFilePath,
    );
  }
}
