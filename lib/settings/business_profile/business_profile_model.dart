import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfile {
  int? id;
  String name;
  String description;
  BusinessType type;
  BusinessProfile({
    this.id,
    required this.name,
    required this.description,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': EnumToString.convertToString(type),
    };
  }

  factory BusinessProfile.fromMap(Map<String, dynamic> map) {
    return BusinessProfile(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      type: map['type'] ==
              EnumToString.convertToString(BusinessType.mahniSiamZuar)
          ? BusinessType.mahniSiamZuar
          : BusinessType.miSiamsaZuar,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessProfile.fromJson(String source) =>
      BusinessProfile.fromMap(json.decode(source));
}
