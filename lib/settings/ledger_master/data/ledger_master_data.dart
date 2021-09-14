import 'package:sentezel/common/enums/status_enum.dart';

import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';

List<LedgerMaster> ledgerMasterData = [
  // --------Special Ledger------------
  // 1- Bank Ledger
  LedgerMaster.withId(
    id: LedgerMasterIndex.Bank,
    name: 'Bank',
    description: 'All Transaction Involving Bank',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),
  //2-Cash
  LedgerMaster.withId(
    id: LedgerMasterIndex.Cash,
    name: 'Cash',
    description: 'All Transaction Involving Cash',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //3-Purchase
  LedgerMaster.withId(
    id: LedgerMasterIndex.Purchase,
    name: 'Purchase',
    description:
        'All Transaction Involving Purchase of Item for resell or raw material',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //4-Discount Account
  LedgerMaster.withId(
    id: LedgerMasterIndex.Discount,
    name: 'Discount',
    description: 'All Transaction with Discount',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //5-Goods
  LedgerMaster.withId(
    id: LedgerMasterIndex.Goods,
    name: 'Goods',
    description: 'Goods',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //----------Direct Expenses------------
  //6-Wages
  LedgerMaster.withId(
    id: LedgerMasterIndex.Wages,
    name: 'Wages',
    description: 'Wages of Employees',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //7-Payment
  LedgerMaster.withId(
    id: LedgerMasterIndex.Payment,
    name: 'Payment',
    description: 'Payment',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //8-Receipt
  LedgerMaster.withId(
    id: LedgerMasterIndex.Received,
    name: 'Receipt',
    description: 'Receipt',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //9-Carriage Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.CarriageExpense,
    name: 'Carriage Expenses',
    description: '',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //10-Custom Duty
  LedgerMaster.withId(
    id: LedgerMasterIndex.CustomDuty,
    name: 'Custom duty',
    description: 'Custom duty',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //11-Fuel
  LedgerMaster.withId(
    id: LedgerMasterIndex.Fuel,
    name: 'Fuel',
    description: 'Fuel',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //12-Electric Bill
  LedgerMaster.withId(
    id: LedgerMasterIndex.ElectricBill,
    name: 'Electric Bill',
    description: 'Electric Bill',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //13-Consumable
  LedgerMaster.withId(
    id: LedgerMasterIndex.Consumable,
    name: 'Consumable',
    description: 'Consumable',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //14-Packing Expense
  LedgerMaster.withId(
    id: LedgerMasterIndex.PackingExpense,
    name: 'Packing Expense',
    description: 'Packing Expense',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //15-Royalty
  LedgerMaster.withId(
    id: LedgerMasterIndex.Royalty,
    name: 'Royalty',
    description: '',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),

  //------------Indirect Expenses----------

  //16-Salaries
  LedgerMaster.withId(
    id: LedgerMasterIndex.Salaries,
    name: 'Salaries',
    description: 'Salaries of Employees',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),

  //17-Rent
  LedgerMaster.withId(
    id: LedgerMasterIndex.Rent,
    name: 'Rent',
    description: 'Rent Paid',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //18-Furniture
  LedgerMaster.withId(
    id: LedgerMasterIndex.Furniture,
    name: 'Furniture',
    description: 'Transactions made for the purchase of Furnitures',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //19-Water Bill
  LedgerMaster.withId(
    id: LedgerMasterIndex.WaterBill,
    name: 'Water Bill',
    description: 'Water Bill',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //20-Tax
  LedgerMaster.withId(
    id: LedgerMasterIndex.Tax,
    name: 'Tax',
    description: 'Tax payment',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //21-Sundry Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.SundryExpenses,
    name: 'Sundry Expenses',
    description: 'Sundry Expenses',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //22-Printing & Stationery
  LedgerMaster.withId(
    id: LedgerMasterIndex.PrintingAndStationery,
    name: 'Printing & Stationery',
    description: 'Printing & Stationery',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //23-Telephone Charges
  LedgerMaster.withId(
    id: LedgerMasterIndex.TelephoneCharges,
    name: 'Telephone Charges',
    description: 'Telephone Charges',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //24-Staff welfare expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.StaffWelfareExpenses,
    name: 'Staff welfare expenses',
    description: 'Staff welfare expenses',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //25-Establishment Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.EstablishmentExpenses,
    name: 'Establishment Expenses',
    description: 'Establishment Expenses',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //26-Internet Bill
  LedgerMaster.withId(
    id: LedgerMasterIndex.InternetBill,
    name: 'Internet Bill',
    description: 'Internet Bill',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //27-Courier Charge
  LedgerMaster.withId(
    id: LedgerMasterIndex.CourierCharges,
    name: 'Courier Charge',
    description: 'Courier Charge',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //28-Distribution Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.DistributionExpenses,
    name: 'Distribution Expenses',
    description: 'Distribution Expenses',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //29-Travelling Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.TravellingExpense,
    name: 'Travelling Expenses',
    description: 'Travelling Expenses',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //30-Freight Outward
  LedgerMaster.withId(
    id: LedgerMasterIndex.FreightOutward,
    name: 'Freight Outward',
    description: 'Freight Outward',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //31-Audit Fee
  LedgerMaster.withId(
    id: LedgerMasterIndex.AudiFee,
    name: 'Audit Fee',
    description: 'Audit Fee',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //32-Bad Debts
  LedgerMaster.withId(
    id: LedgerMasterIndex.BadDebts,
    name: 'Bad Debts',
    description: 'Debts which are estimated to be uncollectible',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //33-Provision for bad debts
  LedgerMaster.withId(
    id: LedgerMasterIndex.ProvisionForBadDebts,
    name: 'Provision for Bad Debts',
    description: 'Account to make solution for bad debts',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //34-Advertisement
  LedgerMaster.withId(
    id: LedgerMasterIndex.Advertisement,
    name: 'Advertisement',
    description: 'Money Use for Advertisement',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //35-Charity/Donation
  LedgerMaster.withId(
    id: LedgerMasterIndex.CharityDonation,
    name: 'Charity/Donation',
    description: 'Transactions made for Charity and/or Donations',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //36-Depreciation
  LedgerMaster.withId(
    id: LedgerMasterIndex.Depreciation,
    name: 'Depreciation',
    description: 'Depreciation',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //37-Bank Charges
  LedgerMaster.withId(
    id: LedgerMasterIndex.BankCharges,
    name: 'Bank Charges',
    description: 'Charges made by the bank to us',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //38-Administrative Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.AdministrativeExpenses,
    name: 'Administrative Expenses',
    description: 'Expenses for the cause of Administrations',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //39-Selling Commission
  LedgerMaster.withId(
    id: LedgerMasterIndex.SellingCommision,
    name: 'Selling Commission',
    description: 'Selling Commission',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //40-Sample Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.SampleExpenses,
    name: 'Sample Expenses',
    description: 'Sample Expenses',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //41-Liscense Fee
  LedgerMaster.withId(
    id: LedgerMasterIndex.LicenseFee,
    name: 'Liscense Fee',
    description: 'Fees paid for license',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //42-Delivery Charges
  LedgerMaster.withId(
    id: LedgerMasterIndex.DeliveryCharge,
    name: 'Delivery Charges',
    description: 'Delivery Charges',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //43-Sales tax paid
  LedgerMaster.withId(
    id: LedgerMasterIndex.SalesTaxPaid,
    name: 'Sales tax paid',
    description: 'Sales tax paid',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //44-Loss on sale of assets
  LedgerMaster.withId(
    id: LedgerMasterIndex.LossOnSaleOfAssets,
    name: 'Loss on sale of assets',
    description: 'Loss on sale of assets',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //45-Loss by Fire/Theft
  LedgerMaster.withId(
    id: LedgerMasterIndex.LossByFireOrTheft,
    name: 'Loss by Fire/Theft',
    description: '',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //46-Repair/Renewal/Maintenance
  LedgerMaster.withId(
    id: LedgerMasterIndex.RepairRenewalMaintenance,
    name: 'Repair/Renewal/Maintenance',
    description: 'Account for repair, renewal and maintenance',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //47-Legal Charges
  LedgerMaster.withId(
    id: LedgerMasterIndex.LegalCharge,
    name: 'Legal Charges',
    description: 'Legal Charges',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //48-Insurance
  LedgerMaster.withId(
    id: LedgerMasterIndex.Insurance,
    name: 'Insurance',
    description: 'Insurance',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //49-Sales
  LedgerMaster.withId(
    id: LedgerMasterIndex.Sales,
    name: 'Sales',
    description: 'Sales account excluding sale returns',
    type: LedgerMasterType.direct,
    status: Status.active,
  ),
  //50-Sales Return
  LedgerMaster.withId(
    id: LedgerMasterIndex.SalesReturn,
    name: 'Sales Return',
    description: 'Sales Return',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //51-Purchase Return
  LedgerMaster.withId(
    id: LedgerMasterIndex.PurchaseReturn,
    name: 'Purchase Return',
    description: 'Purchase Return',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //52-Manufacturing Expenses
  LedgerMaster.withId(
    id: LedgerMasterIndex.ManufacturingExpenses,
    name: 'Manufacturing Expenses',
    description: 'Manufacturing Expenses',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //53-Bank Interest Received
  LedgerMaster.withId(
    id: LedgerMasterIndex.BankInterestReceived,
    name: 'Bank Interest Received',
    description: 'Bank Interest Received',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //54-Discount Received
  LedgerMaster.withId(
    id: LedgerMasterIndex.DiscountReceived,
    name: 'Discount Received',
    description: 'Discount Received',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //55-Rent Received
  LedgerMaster.withId(
    id: LedgerMasterIndex.RentReceived,
    name: 'Rent Received',
    description: 'Rent Received',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //56-Commission Received
  LedgerMaster.withId(
    id: LedgerMasterIndex.CommissionReceived,
    name: 'Commission Received',
    description: 'Commission Received',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //57-Profit on sale of Asset
  LedgerMaster.withId(
    id: LedgerMasterIndex.ProfitOnSaleOfAssets,
    name: 'Profit on sale of Asset',
    description: 'Profit on sale of Asset',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
  //58-Capital
  LedgerMaster.withId(
    id: LedgerMasterIndex.Capital,
    name: 'Capital',
    description: 'Capital',
    type: LedgerMasterType.indirect,
    status: Status.active,
  ),
];
