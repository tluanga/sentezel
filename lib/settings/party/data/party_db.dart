import 'package:sentezel/settings/party/party_config.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PartyDb {
  static void execute(Database db) async {
    await db.execute(
      '''
      CREATE TABLE 
        ${PartyConfig.partyTable}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,           
            type TEXT,
            status TEXT
             )''',
    );
  }
}
