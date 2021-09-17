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
}
