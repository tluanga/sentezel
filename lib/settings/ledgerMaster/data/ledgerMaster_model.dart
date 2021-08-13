import 'package:enum_to_string/enum_to_string.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';

class LedgerMaster {
  int id = 0;
  String name;
  String description;
  LedgerMasterType type;
  ActiveInActive status = ActiveInActive.active;
  LedgerMaster({
    required this.name,
    required this.description,
    required this.type,
  });
  LedgerMaster.withId({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.status,
  });

  String getInitialLetter() {
    return this.name[0].toUpperCase();
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != 0) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;
    map['type'] = EnumToString.convertToString(type);
    map['status'] = EnumToString.convertToString(status);

    return map;
  }

  factory LedgerMaster.fromMap(Map<String, dynamic> map) {
    LedgerMasterType _type;
    switch (map['type']) {
      case 'direct':
        _type = LedgerMasterType.direct;
        break;
      case 'indirect':
        _type = LedgerMasterType.indirect;
        break;
      case 'party':
        _type = LedgerMasterType.party;
        break;
      case 'asset':
        _type = LedgerMasterType.asset;
        break;

      default:
        _type = LedgerMasterType.direct;
    }
    ActiveInActive _status;
    switch (map['status']) {
      case 'active':
        _status = ActiveInActive.active;
        break;
      default:
        _status = ActiveInActive.inActive;
    }
    return LedgerMaster.withId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      type: _type,
      status: _status,
    );
  }
}
