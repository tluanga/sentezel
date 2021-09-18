import 'dart:convert';

class PIN {
  int? id;
  int pin;
  String passPhrase;
  String? error;
  PIN({
    this.id,
    required this.pin,
    required this.passPhrase,
    this.error,
  });

  PIN copyWith({
    int? id,
    int? pin,
    String? passPhrase,
    String? error,
  }) {
    return PIN(
      id: id ?? this.id,
      pin: pin ?? this.pin,
      passPhrase: passPhrase ?? this.passPhrase,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pin': pin,
      'passPhrase': passPhrase,
      'error': error,
    };
  }

  factory PIN.fromMap(Map<String, dynamic> map) {
    return PIN(
      id: map['id'],
      pin: map['pin'],
      passPhrase: map['passPhrase'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PIN.fromJson(String source) => PIN.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PIN(id: $id, pin: $pin, passPhrase: $passPhrase, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PIN &&
        other.id == id &&
        other.pin == pin &&
        other.passPhrase == passPhrase &&
        other.error == error;
  }

  @override
  int get hashCode {
    return id.hashCode ^ pin.hashCode ^ passPhrase.hashCode ^ error.hashCode;
  }
}
