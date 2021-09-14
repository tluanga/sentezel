import '../common/database/db_service.dart';

initializeApp() async {
  await DatabaseService.instance.db
      .whenComplete(() => print('Initialization Completed'));
}
