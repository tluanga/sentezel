import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sentezel/authentication/authentication_controller.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/providers/fireBase_provider.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_data.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';

final ledgerMasterRepositoryProvider = Provider<LedgerMasterRepository>(
  (ref) => LedgerMasterRepository(ref.read),
);

class LedgerMasterRepository implements BaseRepository<LedgerMaster> {
  final Reader _read;

  const LedgerMasterRepository(this._read);

  @override
  void add({required LedgerMaster payload}) {
    print('adding a new document in firebase');
    print('payload is $payload');
    // final userId = _read(authControllerProvider)!.uid;
    try {
      final docRef = _read(firebaseFirestoreProvider)
          .collection('sentezel')
          .doc('thanga')
          .collection('ledgerMaster')
          .add(payload.toJson());
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  getItem({required int id}) {
    return ledgerMasterData.firstWhere((element) => element.id == 0);
  }

  @override
  List<LedgerMaster> getList() {
    return ledgerMasterData.toList();
  }

  @override
  void remove({required id}) {
    ledgerMasterData.remove(id);
  }

  @override
  void update({required payload}) {
    int index =
        ledgerMasterData.indexWhere((element) => element.name == payload.name);
    print('index $index');
    ledgerMasterData[index] = payload.copyWith(status: payload.status);

    print('After update ${ledgerMasterData[index]}');
  }
}
