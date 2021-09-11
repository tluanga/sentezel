import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final container = ProviderContainer();

  final value = await container.read(transactionRepositoryProvider).getList();
  expect(1, value.length);
}
