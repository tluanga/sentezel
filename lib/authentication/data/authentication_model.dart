import 'dart:convert';

class Authentication {
  int? id;
  int pin;
  Authentication({
    this.id,
    required this.pin,
  });

  Authentication copyWith({
    int? id,
    int? pin,
  }) {
    return Authentication(
      id: id ?? this.id,
      pin: pin ?? this.pin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pin': pin,
    };
  }

  factory Authentication.fromMap(Map<String, dynamic> map) {
    return Authentication(
      id: map['id'],
      pin: map['pin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Authentication.fromJson(String source) =>
      Authentication.fromMap(json.decode(source));

  @override
  String toString() => 'Authentication(id: $id, pin: $pin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Authentication && other.id == id && other.pin == pin;
  }

  @override
  int get hashCode => id.hashCode ^ pin.hashCode;
}
