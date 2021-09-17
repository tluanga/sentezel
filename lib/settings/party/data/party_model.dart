import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:sentezel/common/enums/status_enum.dart';

class Party {
  int? id;
  String name;
  String description;
  Status? status = Status.active;
  Party({
    this.id,
    required this.name,
    required this.description,
    this.status = Status.active,
  });

  Party copyWith({
    int? id,
    String? name,
    String? description,
    Status? status,
  }) {
    return Party(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  String getInitialLetter() {
    return name[0].toUpperCase();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': EnumToString.convertToString(status),
    };
  }

  factory Party.fromMap(Map<String, dynamic> map) {
    Status _status;
    switch (map['status']) {
      case 'active':
        _status = Status.active;
        break;
      default:
        _status = Status.inActive;
    }
    return Party(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      status: _status,
    );
  }

  String toJson() => json.encode(toMap());

  factory Party.fromJson(String source) => Party.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Party(id: $id, name: $name, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Party &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ status.hashCode;
  }
}
