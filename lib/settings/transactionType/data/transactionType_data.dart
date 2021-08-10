import 'package:sentezel/config/constants/transaction_constant.dart';
import 'package:sentezel/helpers/database/ledgerId.constants.dart';
import 'package:sentezel/helpers/database/transactionType.constant.dart';
import 'package:sqflite/sqflite.dart';

const transactionTypeData = [
  {
    'name': 'Purchase of Material',
    'description': 'Purchase of Material for Resell or for Production',
    'sumChetVelDanType': TransactionConstant.lei,
    'debitSideLedger': LedgerID.PURCHASEAC,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Purchase of Assets',
    'description':
        'Purchase of Material for Business, not for Resell or Raw Material',
    'sumChetVelDanType': TransactionConstant.lei,
    'debitSideLedger': LedgerID.PURCHASEAC,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Sale of Goods',
    'description': 'Sales of Goods which are not manufactured',
    'sumChetVelDanType': TransactionConstant.hralh,
    'debitSideLedger': LedgerID.CASHAC,
    'creditSideLedger': LedgerID.GOODSAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Wages',
    'description': 'Hnathawkte hlawh',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.WAGES,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Carriage expenses',
    'description': 'Bungraw phur kualnaa sum hman',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.CARRIAGE,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Manufacturing expenses',
    'description': 'bungraw lakkhawmna',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.MANUFACTURING_EXPENSES,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Packing expenses',
    'description': 'bungraw pack na',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.PACKING,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Salaries ',
    'description': 'hnathawkate thla tin hlawh',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.SALARIES,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Office rent',
    'description': 'office luahna man',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.OFFICE_EXPENSES,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Printing & Stationery',
    'description': 'Lehkha print na,etc. leh Stationary a sum hman te',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.PRINTING_AND_STATIONERY,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Telephone Charges',
    'description': 'bungraw pack na',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.TELEPHONE_CHARGES,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  },
  {
    'name': 'Postage and telegram',
    'description': 'postage and telegram',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.PRINTING_AND_STATIONERY,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }
  {
    'name': 'Insurance',
    'description': 'Insurance',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.INSURANCE,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Audit fees',
    'description': 'audit fee',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.AUDIT_FEE,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }
  {
    'name': 'Electricity',
    'description': 'Electric bill leh electric lama sum hmanna te',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.ELECTRIC_BILL,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }
  {
    'name': 'Repairs and renewal',
    'description': 'Thil siam thatnaa sum hman te',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.REPAIRS_RENEWAL_MAINTENANCE,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }
  {
    'name': 'Advertisement',
    'description': 'advertisement',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.ADVERTISEMENT,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }
  {
    'name': 'Discount',
    'description': 'Discount kan pek na',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.DISCOUNTAC,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Depreciation',
    'description': 'Thil man a ai tlawma kan pekna zat',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.DEPRECIATIONAC,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Carriage outward',
    'description': 'Carriage outward',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.CARRIAGE,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Bad debts',
    'description': 'Ba min pek tawh loh tur te',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.BAD_DEBTS,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Provision for bad debts',
    'description': 'bat ral te phuhrukna tur',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.PROVISION_FOR_BAD_DEBTS,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Selling commission',
    'description': 'Selling commission',
    'sumChetVelDanType': 3,
    'debitSideLedger': LedgerID.SELLING_COMMISSION,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Bank charges',
    'description': 'bank charges',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.BANK_CHARGES,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Loss on sale of asset',
    'description': 'bungraw hralhchhawnna a pawisa hloh na',
    'sumChetVelDanType': TransactionConstant.pekchhuah,
    'debitSideLedger': LedgerID.LOSS_ON_SALE_OF_ASSETS,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Discount Recieved',
    'description': 'thil leina a discount kan dawn zat',
    'sumChetVelDanType': TransactionConstant.lakluh,
    'debitSideLedger': LedgerID.CASHAC,
    'creditSideLedger': LedgerID.DISCOUNT_RECEIVED,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Commission recieved',
    'description': 'commission na a hmuh zat',
    'sumChetVelDanType': TransactionConstant.lakluh,
    'debitSideLedger': LedgerID.CASHAC,
    'creditSideLedger': LedgerID.COMMISSION_RECEIVED,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Bank interest',
    'description': 'bank interest dawn zat',
    'sumChetVelDanType': TransactionConstant.lakluh,
    'debitSideLedger': LedgerID.BANK,
    'creditSideLedger': LedgerID.BANK_INTEREST_RECEIVED,
    'active': TransactionTypeConstant.active, // la ngaihtuah tur
  }{
    'name': 'Rent recieved',
    'description': 'Kan in/dawr luahman atanga sum dawn',
    'sumChetVelDanType': TransactionConstant.lakluh,
    'debitSideLedger': LedgerID.CASHAC,
    'creditSideLedger': LedgerID.RENT_RECEIVED,
    'active': TransactionTypeConstant.active,
  }{
    'name': 'Profit on sale of asset',
    'description': 'Bungraw hralhchhawnna atanga hlawkna',
    'sumChetVelDanType': TransactionConstant.lakluh,
    'debitSideLedger': LedgerID.CASHAC,
    'creditSideLedger': LedgerID.PROFIT_ON_SALE_OF_ASSET,
    'active': TransactionTypeConstant.active,
  }{
      'name': 'Sale Return',
      'description': 'Bungraw hralhchhawn tawh let leh',
      'sumChetVelDanType': TransactionConstant.pekchhuah,
      'debitSideLedger': LedgerID.SALERETURN,
      'creditSideLedger': LedgerID.CASHAC,
      'active': TransactionTypeConstant.active,
    },{
      'name': 'Purchase Return',
      'description': 'Bungraw hralhchhawn tawh let leh',
      'sumChetVelDanType': TransactionConstant.lakluh,
      'debitSideLedger': LedgerID.CASHAC,
      'creditSideLedger': LedgerID.PURCHASERETURN,
      'active': TransactionTypeConstant.active,
    },
     {
      'name': 'Consumer Debt  Settlement',
      'description': 'Customer ten an ba an pek',
      'sumChetVelDanType': TransactionConstant.debtRepaymentByDebtor,
      'debitSideLedger': LedgerID.CASHAC, //this can also be a bank
      'creditSideLedger': 0,
      'active': TransactionTypeConstant
          .active, // Party ID a ngaih avangin 0 a dah rih a ni
    },{
      'name': 'BusinessProfile Debt Bill Settlement',
      'description': 'Customer te Bill khat ba pek',
      'sumChetVelDanType': TransactionConstant.debtRepaymentToCreditor,
      'debitSideLedger': 0, // Party ID a ngaih avangin 0 a dah rih a ni
      'creditSideLedger': LedgerID.CASHAC, //this can also be a bank
      'active': TransactionTypeConstant.active,
    },
    
    {
      'name': 'Bank to Cash',
      'description': 'Bank to Cash Transaction',
      'sumChetVelDanType': TransactionConstant.bankToCash,
      'debitSideLedger': LedgerID.CASHAC,
      'creditSideLedger': LedgerID.BANK,
      'active': TransactionTypeConstant.active,
    },
    {
      'name': 'Cash to Bank',
      'description': 'Cash to Bank Transaction',
      'sumChetVelDanType': TransactionConstant.cashToBank,
      'debitSideLedger': LedgerID.BANK,
      'creditSideLedger': LedgerID.CASHAC,
      'active': TransactionTypeConstant.active,
    },
    {
      'name': 'Capital Injection',
      'description': 'Capital Injection into Business',
      'sumChetVelDanType': TransactionConstant.capitalInjection,
      'debitSideLedger': LedgerID.BANK,
      'creditSideLedger': LedgerID.CAPITALAC,
      'active': TransactionTypeConstant.active,
    },
    {
      'name': 'Opening Balance Cash',
      'description': 'Opening balance Cash',
      'sumChetVelDanType': TransactionConstant.openingBalanceCash,
      'debitSideLedger': LedgerID.CAPITALAC,
      'creditSideLedger': LedgerID.CASHAC,
      'active': TransactionTypeConstant.active,
    },
      {
      'name': 'Opening Balance Bank',
      'description': 'Opening balance Bank',
      'sumChetVelDanType': TransactionConstant.openingBalanceBank,
      'debitSideLedger': LedgerID.CAPITALAC,
      'creditSideLedger': LedgerID.BANK,
      'active': TransactionTypeConstant.active,
    },
     {
      'name': 'Custom Duty',
      'description': 'Custom Duty',
      'sumChetVelDanType': TransactionConstant.pekchhuah,
      'debitSideLedger': LedgerID.CUSTOM_DUTY,
      'creditSideLedger': LedgerID.CASHAC,
      'active': TransactionTypeConstant.active,
    },
];

void injectTransactionType(Database db) async {
  const String transactionTypeTable = 'transactionType_table';

  //--------Special Transaction Type--------------
  // 1---Purchase of Material for Resell or for Production
  //1
  print('Inject Transaction Type');
  await db.insert(
    transactionTypeTable,
  );
  //2
  await db.insert(
    transactionTypeTable,
  );
  //3
  await db.insert(
    transactionTypeTable,
  );
  //4
  await db.insert(
    transactionTypeTable,
  );
  //5
  await db.insert(
    transactionTypeTable,
  );
  //6
  await db.insert(
    transactionTypeTable,
  );
  //7
  await db.insert(
    transactionTypeTable,
  );
  //8
  await db.insert(
    transactionTypeTable,
  );
  //9
  await db.insert(
    transactionTypeTable,
  );
  //10
  await db.insert(
    transactionTypeTable,
  );
  //11
  await db.insert(
    transactionTypeTable,
  );
  //12
  await db.insert(
    transactionTypeTable,
  );
  //13
  await db.insert(transactionTypeTable, );
  //14
  await db.insert(transactionTypeTable, );
  //15
  await db.insert(transactionTypeTable, );
  //16
  await db.insert(transactionTypeTable, );
  //17
  await db.insert(transactionTypeTable, );
  //18
  await db.insert(transactionTypeTable, );
  //19
  await db.insert(transactionTypeTable, );
  //20
  await db.insert(transactionTypeTable, );
  //21
  await db.insert(transactionTypeTable, );
  //22
  await db.insert(transactionTypeTable, );
  //23
  await db.insert(transactionTypeTable, );
  //24
  await db.insert(transactionTypeTable, );
  //25
  await db.insert(transactionTypeTable, );

  ///////////////////////////////////////////////////////////////////

  //26
  await db.insert(transactionTypeTable, );
  //27
  await db.insert(transactionTypeTable, );
  //28
  await db.insert(transactionTypeTable, );
  //29
  await db.insert(transactionTypeTable, );
  //30
  await db.insert(transactionTypeTable, );
  //31
  await db.insert(
    transactionTypeTable,
    
  );
  //32
  await db.insert(
    transactionTypeTable,
    
  );
  //33-- Customer ten ba an rulhna
  await db.insert(
    transactionTypeTable,
   
  );
  //34 BusinessProfile/Sumndawnna a tan a ba- rulhna
  await db.insert(
    transactionTypeTable,
    
  );
  //35
  await db.insert(
   
  );
  //36
  await db.insert(
    transactionTypeTable,
    
  );
  //37
  await db.insert(
    transactionTypeTable,
    
  );

  // 38
  await db.insert(
    transactionTypeTable,
    
  );

  // 39
  await db.insert(
    transactionTypeTable,
  
  );

  // 40
  await db.insert(
    transactionTypeTable,
   
  );
  // List<Map> list = await db.rawQuery('SELECT * FROM transactionType_table');
  // print('The value of list is');
  // print(list.length);

  // //--------Mock Data -- LedgerMaster Party-------------------
  // //52
  // await db.insert(masterLedgerTable, {
  //   'name': 'Alex Telles',
  //   'description': 'Aizawl',
  //   'directOrIndirect': cDirectAc,
  //   'party': {LedgerMasterConstant.party},
  //   'asset': cNonASSET
  // });
  // //53
  // await db.insert(masterLedgerTable, {
  //   'name': 'William Defoe',
  //   'description': 'Kan Hmun',
  //   'directOrIndirect': cDirectAc,
  //   'party': {LedgerMasterConstant.party},
  //   'asset': cNonASSET
  // });
  // //54
  // await db.insert(masterLedgerTable, {
  //   'name': 'Rema ',
  //   'description': 'Zohmun',
  //   'directOrIndirect': cDirectAc,
  //   'party': {LedgerMasterConstant.party},
  //   'asset': cNonASSET
  // });
  // //55
  // await db.insert(masterLedgerTable, {
  //   'name': 'Zomawia ',
  //   'description': 'Aizawl',
  //   'directOrIndirect': cDirectAc,
  //   'party': {LedgerMasterConstant.party},
  //   'asset': cNonASSET
  // });
  // //56
  // await db.insert(masterLedgerTable, {
  //   'name': 'Zasiama ',
  //   'description': 'Lunglei',
  //   'directOrIndirect': cDirectAc,
  //   'party': {LedgerMasterConstant.party},
  //   'asset': cNonASSET
  // });
  // //57
  // await db.insert(masterLedgerTable, {
  //   'name': 'Rotluanga ',
  //   'description': 'Thingkawrdeng',
  //   'directOrIndirect': cDirectAc,
  //   'party': {LedgerMasterConstant.party},
  //   'asset': cNonASSET
  // });

  // //-----------------MockData for Asset Item----------
  // //58
  // await db.insert(masterLedgerTable, {
  //   'name': 'Chair ',
  //   'description': 'Chair',
  //   'directOrIndirect': cDirectAc,
  //   'party': LedgerMasterConstant.notParty,
  //   'asset': cASSET
  // });
  // //59
  // await db.insert(masterLedgerTable, {
  //   'name': 'Machinery ',
  //   'description': 'Machiner',
  //   'directOrIndirect': cDirectAc,
  //   'party': LedgerMasterConstant.notParty,
  //   'asset': cASSET
  // });
}
