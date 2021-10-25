import 'dart:convert';

class PIN {
  int? id;
  int pin;
  String passPhrase;
  PIN({
    this.id,
    required this.pin,
    required this.passPhrase,
  });

  PIN copyWith({
    int? id,
    int? pin,
    String? passPhrase,
  }) {
    return PIN(
      id: id ?? this.id,
      pin: pin ?? this.pin,
      passPhrase: passPhrase ?? this.passPhrase,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pin': pin,
      'passPhrase': passPhrase,
    };
  }

  factory PIN.fromMap(Map<String, dynamic> map) {
    return PIN(
      id: map['id'],
      pin: map['pin'],
      passPhrase: map['passPhrase'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PIN.fromJson(String source) => PIN.fromMap(json.decode(source));

  @override
  String toString() => 'PIN(id: $id, pin: $pin, passPhrase: $passPhrase)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PIN &&
        other.id == id &&
        other.pin == pin &&
        other.passPhrase == passPhrase;
  }

  @override
  int get hashCode => id.hashCode ^ pin.hashCode ^ passPhrase.hashCode;
}
