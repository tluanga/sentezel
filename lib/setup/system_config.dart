import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sentezel/setup/request_permission_helper.dart';

class SystemConfig {
  static late final String appDirectory;
  static late final String appDocumentDirectory;
  static late final String appUserProfileDirectory;
  static late final String appBackupDirectory;
  static late final String appBackupFile;
  static const maximumShiftDuration = 24; //24 hrs

  static Future<bool> setCustomDirectory() async {
    bool permission =
        await requestPermissionHelper(Permission.manageExternalStorage);

    bool _setupCompleted = false;
    if (permission) {
      var externalStorageDirectory = await getExternalStorageDirectory();
      String newPath = "";

      Directory directory = externalStorageDirectory!;

      List<String> paths = directory.path.split("/");
      for (int x = 1; x < paths.length; x++) {
        String folder = paths[x];
        if (folder != "Android") {
          newPath += "/" + folder;
        } else {
          break;
        }
      }
      try {
        appDirectory = newPath + "/lytworkshift/";

        //---------Document Directory---------
        String documentPath = newPath + "/lytworkshift/" + 'document';
        directory = Directory(documentPath);
        await directory.create(recursive: true);
        appDocumentDirectory = directory.path;

        //---------User Profile Directory---------
        String appUserProfilePath = newPath + "/lytworkshift/" + 'userProfile';
        directory = Directory(appUserProfilePath);
        await directory.create(recursive: true);
        appUserProfileDirectory = directory.path;

        //---------User Profile Directory---------
        String appBackupPath = newPath + "/lytworkshift/" + 'backup';
        directory = Directory(appBackupPath);
        await directory.create(recursive: true);
        appBackupDirectory = directory.path;
        print('User Backup path-$appUserProfilePath');

        appBackupFile = newPath + "/lytworkshift/" + 'lytWorkShiftBackup.zip';

        _setupCompleted = true;
      } catch (err) {
        print('Error $err');
      }

      //---------------App Backup File Path----------

    }

    return _setupCompleted;
  }

  static setup() async {
    await setCustomDirectory();
    print('--------SETTING UP GLOBAL APP CONFIGURATION---------');
    print('appDocumentDirectory-$appDocumentDirectory');
    print('appDbDirectory--$appUserProfileDirectory');
    print('appBackup-$appBackupDirectory');
  }
}
