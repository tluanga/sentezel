import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';

class EditTransactionCategoryState {
  int id;
  String name;
  String description;
  LedgerMaster ledger;
  TransactionType transactionType;
  Status status;
  EditTransactionCategoryState({
    required this.id,
    required this.name,
    required this.description,
    required this.ledger,
    required this.transactionType,
    required this.status,
  });

  EditTransactionCategoryState copyWith({
    int? id,
    String? name,
    String? description,
    LedgerMaster? ledger,
    TransactionType? transactionType,
    Status? status,
  }) {
    return EditTransactionCategoryState(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ledger: ledger ?? this.ledger,
      transactionType: transactionType ?? this.transactionType,
      status: status ?? this.status,
    );
  }
}
