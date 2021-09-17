enum LedgerMasterType {
  //Direct - Paty Account
  direct,
  indirect,
  party, //party account are indirect account
  asset, //all asset account are direct account
}

String getLedgerMasterTypeEnumInString(LedgerMasterType type) {
  switch (type) {
    case LedgerMasterType.direct:
      return 'Direct';
    case LedgerMasterType.indirect:
      return 'In Direct';
    case LedgerMasterType.party:
      return 'Party';
    case LedgerMasterType.asset:
      return 'Asset';
    default:
      return 'Asset';
  }
}
