import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

void main() {
  test('read ledgerMaster', () async {
    final container = ProviderContainer();
    final a = await container.read(ledgerMasterRepositoryProvider).getList();
    expect(0, a.length);
  });
}
