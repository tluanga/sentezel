import 'package:path_provider/path_provider.dart';

class SystemConfig {
  static const appName = 'Sentezel';
  static late final String appDirectory;
  static late final String appDocumentDirectory;
  static late final String appBackupDirectory;
  static late final String appBackupFile;
  static late final String appRestoreDirectory;

  static Future<bool> setCustomDirectory() async {
    // await requestPermissionHelper(Permission.camera);
    // await requestPermissionHelper(Permission.accessMediaLocation);

    bool _setupCompleted = false;

    var externalStorageDirectory = await getExternalStorageDirectory();
    var app = await getApplicationDocumentsDirectory();
    var data = await getTemporaryDirectory();
    print('DATA PATH IS $data');
    appDirectory = app.path;
    // var libraryDirectory = await getLibraryDirectory();
    // var downloadDirectory = await getDownloadsDirectory();

    // print('Library Directory-${libraryDirectory.path}');
    // print('Download Directory-${downloadDirectory!.path}');

    // Directory directory = externalStorageDirectory!;

    try {
      //---------Document Directory---------
      String documentPath = appDirectory + "/" + 'document';
      Directory directory = Directory(documentPath);
      await directory.create(recursive: true);
      appDocumentDirectory = directory.path;

      //---------User Profile Directory---------
      String appUserProfilePath = appDirectory + "/" + 'userProfile';
      directory = Directory(appUserProfilePath);
      await directory.create(recursive: true);
      appUserProfileDirectory = directory.path;

      //---------User Profile Directory---------
      String appBackupPath = appDirectory + "/" + 'backup';
      directory = Directory(appBackupPath);
      await directory.create(recursive: true);
      appBackupDirectory = directory.path;
      print('User Backup path-$appUserProfilePath');

      //---------System Restore Directory---------
      String appRestorePath = appDirectory + "/" + 'restore';
      directory = Directory(appRestorePath);
      await directory.create(recursive: true);
      appRestoreDirectory = directory.path;
      print('App Restore path-$appUserProfilePath');

      appBackupFile = appDirectory + "/" + 'lytWorkShiftBackup.zip';

      _setupCompleted = true;
    } catch (err) {
      print('Error $err');
    }

    //---------------App Backup File Path----------

    return _setupCompleted;
  }

  static setup() async {
    await setCustomDirectory();
    print('--------SETTING UP GLOBAL APP CONFIGURATION---------');
    print('appDirectory-$appDirectory');
    print('appDocumentDirectory-$appDocumentDirectory');

    print('appBackup-$appBackupDirectory');
  }
}
