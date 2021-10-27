class App {
  bool businessProfileIsSetup;
  bool pinIsSetup;
  App({
    required this.businessProfileIsSetup,
    required this.pinIsSetup,
  });

  App copyWith({
    bool? businessProfileIsSetup,
    bool? pinIsSetup,
  }) {
    return App(
      businessProfileIsSetup:
          businessProfileIsSetup ?? this.businessProfileIsSetup,
      pinIsSetup: pinIsSetup ?? this.pinIsSetup,
    );
  }
}
