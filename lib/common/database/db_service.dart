class DatabaseService {
  static final DatabaseService instance = DatabaseService._instance();
  static Database? _db;

  DatabaseService._instance();

  static void resetDatabase() {
    _db = null;
  }

  // ------TABLE -1- PROFILE TABLE------------
  static const String userTable = 'user_table';
  String userId = 'id';
  String userFullName = 'fullName';
  String userEmail = 'email';  
  String userPin = 'pin';


  //-------TABLE -2---BUSINESS PROFILE--
  String businessName='name';
  String businessAddress='address';
  String businessContactNo='contactNo';

  // // -----TABLE -2 SETTINGS TABLE----------
  // static const String settingsTable = 'settings_table';
  // String settingsId = 'id';
  // String settingsTaxRate = 'taxRate';
  // String settingsfirstDayOfWeek = 'firstDayOfWeek';
  // String settingsFirstPayPeriod = 'firstPayPeriod';
  // String settingsDefaultShiftStartTime = 'defaultShiftStartTime';
  // String settingsDefaultShiftEndTime = 'defaultShiftEndTime';
  // String settingsDefaultPayRate = 'defaultPayRate';
  // String settingsDefaultBreakDuration = 'defaultBreakDuration';

  

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }

    return _db!;
  }

  Future<Database> _initDb() async {
    print('Initializing database');
    // String dbDirectoryPath = SystemConfig.appDbDirectory;

    // String path = dbDirectoryPath + '/lyt_work_shift.db';

    //-------Using application-Directory-----------
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/sentezel.db';

    final dbManager = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return dbManager;
  }

  void _createDb(Database db, int version) async {
    // Table 1- PROFILE TABLE

    await db.execute(
      '''
      CREATE TABLE 
        $userTable(
            $userId INTEGER PRIMARY KEY AUTOINCREMENT,
            $userFullName TEXT,
            $userEmail TEXT,
            $userUserName TEXT,
            $userPassword TEXT
             )''',
    );
    // Table 2- SETTINGS TABLE
    await db.execute(
      '''CREATE TABLE
       $settingsTable(
         $settingsId INTEGER PRIMARY KEY AUTOINCREMENT,
         $settingsTaxRate REAL,
         $settingsfirstDayOfWeek INT,
         $settingsFirstPayPeriod INT,
         $settingsDefaultShiftStartTime TEXT,
         $settingsDefaultShiftEndTime TEXT,
         $settingsDefaultPayRate REAL,
         $settingsDefaultBreakDuration INT         
         )''',
    );

    
}


class Database {
}