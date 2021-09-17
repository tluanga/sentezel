import 'package:sentezel/setup/system_config.dart';

import '../common/database/db_service.dart';

initializeApp() async {
  await DatabaseService.instance.db;
  await SystemConfig.setup();
}
