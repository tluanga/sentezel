import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

class BusinessProfile {
  String name;
  String description;
  BusinessType businessType;
  BusinessProfile({
    required this.name,
    required this.description,
    required this.businessType,
  });
}
