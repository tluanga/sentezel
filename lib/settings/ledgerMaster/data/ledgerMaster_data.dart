import 'package:sentezel/common/enums/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';

List<LedgerMaster> ledgerMasterData = [
  // --------Special Ledger------------
  // 1- Bank Ledger
  LedgerMaster(
      
      name: 'Bank',
      description: 'All Transaction Involving Bank',
      type: LedgerMasterType.direct),
  //2-Cash
  LedgerMaster(
    name: 'Cash',
    description: 'All Transaction Involving Cash',
    type: LedgerMasterType.direct,
  ),

  //3-Purchase
  LedgerMaster(
      name: 'Purchase',
      description:
          'All Transaction Involving Purchase of Item for resell or raw material',
      type: LedgerMasterType.direct),

  //4-Discount Account
  LedgerMaster(
    name: 'Discount',
    description: 'All Transaction with Discount',
    type: LedgerMasterType.indirect,
  ),
  //5-Goods
  LedgerMaster(
    name: 'Goods',
    description: 'Goods',
    type: LedgerMasterType.direct,
  ),

  //----------Direct Expenses------------
  //6-Wages
  LedgerMaster(
    name: 'Wages',
    description: 'Wages of Employees',
    type: LedgerMasterType.direct,
  ),

  //7-Payment
  LedgerMaster(
      name: 'Payment', description: 'Payment', type: LedgerMasterType.direct),

  //8-Receipt
  LedgerMaster(
      name: 'Receipt', description: 'Receipt', type: LedgerMasterType.direct),

  //9-Carriage Expenses
  LedgerMaster(
      name: 'Carriage Expenses',
      description: '',
      type: LedgerMasterType.direct),

  //10-Custom Duty
  LedgerMaster(
      name: 'Custom duty',
      description: 'Custom duty',
      type: LedgerMasterType.direct),

  //11-Fuel
  LedgerMaster(
      name: 'Fuel', description: 'Fuel', type: LedgerMasterType.direct),

  //12-Electric Bill
  LedgerMaster(
      name: 'Electric Bill',
      description: 'Electric Bill',
      type: LedgerMasterType.direct),

  //13-Consumable
  LedgerMaster(
      name: 'Consumable',
      description: 'Consumable',
      type: LedgerMasterType.direct),

  //14-Packing Expense
  LedgerMaster(
      name: 'Packing Expense',
      description: 'Packing Expense',
      type: LedgerMasterType.direct),

  //15-Royalty
  LedgerMaster(name: 'Royalty', description: '', type: LedgerMasterType.direct),

  //------------Indirect Expenses----------

  //16-Salaries
  LedgerMaster(
    name: 'Salaries',
    description: 'Salaries of Employees',
    type: LedgerMasterType.indirect,
  ),

  //17-Rent
  LedgerMaster(
    name: 'Rent',
    description: 'Rent Paid',
    type: LedgerMasterType.indirect,
  ),
  //18-Furniture
  LedgerMaster(
    name: 'Furniture',
    description: 'Transactions made for the purchase of Furnitures',
    type: LedgerMasterType.indirect,
  ),
  //19-Water Bill
  LedgerMaster(
    name: 'Water Bill',
    description: 'Water Bill',
    type: LedgerMasterType.indirect,
  ),
  //20-Tax
  LedgerMaster(
    name: 'Tax',
    description: 'Tax payment',
    type: LedgerMasterType.indirect,
  ),
  //21-Sundry Expenses
  LedgerMaster(
    name: 'Sundry Expenses',
    description: 'Sundry Expenses',
    type: LedgerMasterType.indirect,
  ),
  //22-Printing & Stationery
  LedgerMaster(
    name: 'Printing & Stationery',
    description: 'Printing & Stationery',
    type: LedgerMasterType.indirect,
  ),
  //23-Telephone Charges
  LedgerMaster(
    name: 'Telephone Charges',
    description: 'Telephone Charges',
    type: LedgerMasterType.indirect,
  ),
  //24-Staff welfare expenses
  LedgerMaster(
    name: 'Staff welfare expenses',
    description: 'Staff welfare expenses',
    type: LedgerMasterType.indirect,
  ),
  //25-Establishment Expenses
  LedgerMaster(
    name: 'Establishment Expenses',
    description: 'Establishment Expenses',
    type: LedgerMasterType.indirect,
  ),
  //26-Internet Bill
  LedgerMaster(
    name: 'Internet Bill',
    description: 'Internet Bill',
    type: LedgerMasterType.indirect,
  ),
  //27-Courier Charge
  LedgerMaster(
    name: 'Courier Charge',
    description: 'Courier Charge',
    type: LedgerMasterType.indirect,
  ),
  //28-Distribution Expenses
  LedgerMaster(
    name: 'Distribution Expenses',
    description: 'Distribution Expenses',
    type: LedgerMasterType.indirect,
  ),
  //31-Travelling Expenses
  LedgerMaster(
    name: 'Travelling Expenses',
    description: 'Travelling Expenses',
    type: LedgerMasterType.indirect,
  ),
  //32-Freight Outward
  LedgerMaster(
    name: 'Freight Outward',
    description: 'Freight Outward',
    type: LedgerMasterType.indirect,
  ),
  //33-Audit Fee
  LedgerMaster(
    name: 'Audit Fee',
    description: 'Audit Fee',
    type: LedgerMasterType.indirect,
  ),
  //34-Bad Debts
  LedgerMaster(
    name: 'Bad Debts',
    description: 'Debts which are estimated to be uncollectible',
    type: LedgerMasterType.indirect,
  ),
  //35-Provision for bad debts
  LedgerMaster(
    name: 'Provision for Bad Debts',
    description: 'Account to make solution for bad debts',
    type: LedgerMasterType.indirect,
  ),
  //36-Advertisement
  LedgerMaster(
    name: 'Advertisement',
    description: 'Money Use for Advertisement',
    type: LedgerMasterType.indirect,
  ),
  //37-Charity/Donation
  LedgerMaster(
    name: 'Charity/Donation',
    description: 'Transactions made for Charity and/or Donations',
    type: LedgerMasterType.indirect,
  ),
  //38-Depreciation
  LedgerMaster(
    name: 'Depreciation',
    description: 'Depreciation',
    type: LedgerMasterType.indirect,
  ),
  //39-Bank Charges
  LedgerMaster(
    name: 'Bank Charges',
    description: 'Charges made by the bank to us',
    type: LedgerMasterType.indirect,
  ),
  //40-Administrative Expenses
  LedgerMaster(
    name: 'Administrative Expenses',
    description: 'Expenses for the cause of Administrations',
    type: LedgerMasterType.indirect,
  ),
  //41-Selling Commission
  LedgerMaster(
    name: 'Selling Commission',
    description: 'Selling Commission',
    type: LedgerMasterType.indirect,
  ),
  //42-Sample Expenses
  LedgerMaster(
    name: 'Sample Expenses',
    description: 'Sample Expenses',
    type: LedgerMasterType.indirect,
  ),
  //43-Liscense Fee
  LedgerMaster(
    name: 'Liscense Fee',
    description: 'Fees paid for license',
    type: LedgerMasterType.indirect,
  ),
  //44-Delivery Charges
  LedgerMaster(
    name: 'Delivery Charges',
    description: 'Delivery Charges',
    type: LedgerMasterType.indirect,
  ),
  //45-Sales tax paid
  LedgerMaster(
    name: 'Sales tax paid',
    description: 'Sales tax paid',
    type: LedgerMasterType.indirect,
  ),
  //46-Loss on sale of assets
  LedgerMaster(
    name: 'Loss on sale of assets',
    description: 'Loss on sale of assets',
    type: LedgerMasterType.indirect,
  ),
  //47-Loss by Fire/Theft
  LedgerMaster(
    name: 'Loss by Fire/Theft',
    description: '',
    type: LedgerMasterType.indirect,
  ),
  //48-Repair/Renewal/Maintenance
  LedgerMaster(
    name: 'Repair/Renewal/Maintenance',
    description: 'Account for repair, renewal and maintenance',
    type: LedgerMasterType.indirect,
  ),
  //49-Legal Charges
  LedgerMaster(
    name: 'Legal Charges',
    description: 'Legal Charges',
    type: LedgerMasterType.indirect,
  ),
  //50-Insurance
  LedgerMaster(
    name: 'Insurance',
    description: 'Insurance',
    type: LedgerMasterType.indirect,
  ),
  //51-Sales
  LedgerMaster(
    name: 'Sales',
    description: 'Sales account excluding sale returns',
    type: LedgerMasterType.indirect,
  ),
  //52-Sales Return
  LedgerMaster(
    name: 'Sales Return',
    description: 'Sales Return',
    type: LedgerMasterType.indirect,
  ),
  //53-Purchase Return
  LedgerMaster(
    name: 'Purchase Return',
    description: 'Purchase Return',
    type: LedgerMasterType.indirect,
  ),
  //54-Manufacturing Expenses
  LedgerMaster(
    name: 'Manufacturing Expenses',
    description: 'Manufacturing Expenses',
    type: LedgerMasterType.indirect,
  ),
  //55-Bank Interest Received
  LedgerMaster(
    name: 'Bank Interest Received',
    description: 'Bank Interest Received',
    type: LedgerMasterType.indirect,
  ),
  //56-Discount Received
  LedgerMaster(
    name: 'Discount Received',
    description: 'Discount Received',
    type: LedgerMasterType.indirect,
  ),
  //57-Rent Received
  LedgerMaster(
    name: 'Rent Received',
    description: 'Rent Received',
    type: LedgerMasterType.indirect,
  ),
  //58-Commission Received
  LedgerMaster(
    name: 'Commission Received',
    description: 'Commission Received',
    type: LedgerMasterType.indirect,
  ),
  //59-Profit on sale of Asset
  LedgerMaster(
    name: 'Profit on sale of Asset',
    description: 'Profit on sale of Asset',
    type: LedgerMasterType.indirect,
  ),
  //60-Capital
  LedgerMaster(
    name: 'Capital',
    description: 'Capital',
    type: LedgerMasterType.indirect,
  ),
];
