import 'dart:convert';
import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_detail/ledger_detail_controller.dart';
import 'package:sentezel/common/helpers/dateHelper/financial_year_helper.dart';
import 'package:sentezel/settings/backup/backup_model.dart';
import 'package:sentezel/settings/backup/operation_status_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/setup/system_config.dart';

class BackupController extends StateNotifier<Backup> {
  final Reader _read;
  BackupController(this._read)
      : super(
          Backup(operationstatus: OperationStatus.notStarted),
        );
  backup() async {
    //-----------BACKUP OPERATION-----------
    //--clear- delete all files in the backup folder
    final dir = Directory(SystemConfig.appBackupDirectory + '/db/');
    if (await dir.exists() != true) {
      await dir.create(recursive: true);
    }
    dir.deleteSync(recursive: true);
    //Step 2- Recreate the backup directory
    dir.createSync(recursive: true);

    //----------BACKUP-Ledger Master----
    //--read

    //--write

    //----------BACKUP-Transaction Category----
    //--read
    //--write

    //----------BACKUP-Transaction----
    //--read
    //--write
  }
}

// class BackupProvider {
//   UserProfileService _userProfileService = new UserProfileService();
//   SettingsService _settingsService = new SettingsService();
//   ShiftService _shiftService = new ShiftService();
//   ShiftDocumentService _shiftDocumentService = new ShiftDocumentService();
//   bool isZipFileAvailable = false;

//   //---------------Backup Directory-----------------
//   final _userDataBackupPath =
//       SystemConfig.appBackupDirectory + '/db/userProfileDataBackup.txt';

//   final _settingsDataBackupPath =
//       SystemConfig.appBackupDirectory + '/db/settingsDataBackup.txt';

//   final _shiftDataBackupPath =
//       SystemConfig.appBackupDirectory + '/db/shiftDataBackup.txt';

//   final _documentDataBackupPath =
//       SystemConfig.appBackupDirectory + '/db/documentDataBackup.txt';

//   bool isLoading = true;

//   final appBackupDirectory = Directory(SystemConfig.appBackupDirectory);

//   loadData() async {
//     //check the availability of Zip File System

//     final zipFile = File(SystemConfig.appBackupFile);
//     var zipFileStatus = await zipFile.exists();
//     if (zipFileStatus) isZipFileAvailable = true;
//     isLoading = false;
//     notifyListeners();
//   }

//   backUp() async {
//     isLoading = true;
//     //----------Get all data from the database-------------
//     User _user = await _userProfileService.getUserData();
//     Settings _settings = await _settingsService.getSettings();
//     List<Shift> _shiftList = await _shiftService.getAllShift();
//     List<ShiftDocument> _documents =
//         await _shiftDocumentService.getAllShiftDocuments();

//     //---------Shift data conversion-----------
//     var _userConverted = json.encode(_user.toMap());

//     var _settingsConverted = json.encode(_settings.toMap());

//     //---------Shift data conversion-----------
//     var _shiftConverted = '';
//     for (var element in _shiftList) {
//       var a = json.encode(element.toMap());
//       _shiftConverted += '/' + a;
//     }

//     //-------Document data conversion-----------
//     var _documentDataConverted = '';
//     for (var element in _documents) {
//       var b = json.encode(element.toMap());
//       _documentDataConverted += '/' + b;
//     }

//     //--Save the file into backup directory-----
//     //Step 1--Remove backup directory
//     final dir = Directory(SystemConfig.appBackupDirectory + '/db/');
//     if (await dir.exists() != true) {
//       await dir.create(recursive: true);
//     }
//     dir.deleteSync(recursive: true);
//     //Step 2- Recreate the backup directory
//     dir.createSync(recursive: true);

//     //Step 3- Backup Database Files
//     //---------Backup User Profile----
//     await File(_userDataBackupPath).writeAsString(
//       _userConverted.toString(),
//     );

//     //---------Backup Settings Data----
//     await File(_settingsDataBackupPath).writeAsString(
//       _settingsConverted.toString(),
//     );

//     //---------Backup Shift Data ----
//     await File(_shiftDataBackupPath).writeAsString(
//       _shiftConverted.toString(),
//     );

//     //---------Backup Shift Data ----
//     await File(_documentDataBackupPath).writeAsString(
//       _documentDataConverted.toString(),
//     );
//     //Step 4-Copy Document Folder to backup Folder
//     print('Backing up document folder');
//     final docBackupDir = Directory(SystemConfig.appBackupDirectory + '/doc/');
//     await docBackupDir.create(recursive: true);
//     final documentDirectory = Directory(SystemConfig.appDocumentDirectory);
//     var _fileList = documentDirectory.list();
//     _fileList.forEach((element) async {
//       String _fileName = FileHelper.getFileNameFromFilePathHelper(element.path);
//       String _fileBackupPath = docBackupDir.path + _fileName;
//       await File(element.path).copy(_fileBackupPath);
//     });

//     //Step 5-Copy Profile Folder to backup Folder
//     final profileBackupDir =
//         Directory(SystemConfig.appBackupDirectory + '/userProfile/');
//     await profileBackupDir.create(recursive: true);
//     final _profileBackupDir = Directory(SystemConfig.appUserProfileDirectory);
//     var _profileFileList = _profileBackupDir.list();
//     _profileFileList.forEach((element) async {
//       String _fileName = FileHelper.getFileNameFromFilePathHelper(element.path);
//       String _profileBackupPath = profileBackupDir.path + _fileName;
//       await File(element.path).copy(_profileBackupPath);
//     });
//     //Step 6-Create a zip file in root Directory

//     try {
//       //----------------
//       final zipFile = File(SystemConfig.appBackupFile);
//       print('zipfile path ${zipFile.path}');
//       await ZipFile.createFromDirectory(
//           sourceDir: appBackupDirectory,
//           zipFile: zipFile,
//           recurseSubDirs: true);
//     } catch (e) {
//       print(e);
//     }
//     //Step 7-Remove all data in backup folder
//     await appBackupDirectory.delete(recursive: true);
//     await appBackupDirectory.create();
//     //--
//     loadData();
//     isLoading = false;
//   }

//   restore() async {
//     print('--------------STARTING RESTORATION---------');
//     final restoreDirectory = Directory(SystemConfig.appDirectory + 'restore');
//     isLoading = true;
//     // final appDirectory = Directory(SystemConfig.appDirectory);

//     //--RESTORATION PROCEDURE--
//     //Step 1---Try to locate backup zip file,
//     final zipFile = File(SystemConfig.appBackupFile);
//     var zipFileStatus = await zipFile.exists();
//     if (zipFileStatus) {
//       //nofify user the zip file is not available
//       print('file exits');
//       try {
//         //--extract the zip file

//         await ZipFile.extractToDirectory(
//             zipFile: zipFile, destinationDir: restoreDirectory);
//         //--delete the zip file
//         zipFile.delete();
//         isZipFileAvailable = false;
//         //----------restore document---
//         final _documentDirectory = Directory(SystemConfig.appDocumentDirectory);
//         //Clearing current content
//         await _documentDirectory.delete(recursive: true);
//         await _documentDirectory.create(recursive: true);

//         final _restoreDocumentDirectory =
//             Directory(SystemConfig.appDirectory + '/restore/doc');
//         var _fileList = _restoreDocumentDirectory.list();
//         //copy from restore to app doc

//         _fileList.forEach((element) async {
//           String _fileName =
//               FileHelper.getFileNameFromFilePathHelper(element.path);
//           File _recoverFile =
//               File(SystemConfig.appDocumentDirectory + '/' + _fileName);
//           await File(element.path).copy(_recoverFile.path);
//         });
//         //----------restore profile---
//         final _userProfileDirectory =
//             Directory(SystemConfig.appUserProfileDirectory);
//         //Clearing current content
//         await _userProfileDirectory.delete(recursive: true);
//         await _userProfileDirectory.create(recursive: true);

//         final _restoreProfileDirectory =
//             Directory(SystemConfig.appDirectory + '/restore/userProfile');
//         _fileList = _restoreProfileDirectory.list();
//         //copy from restore to app doc

//         _fileList.forEach((element) async {
//           String _fileName =
//               FileHelper.getFileNameFromFilePathHelper(element.path);
//           File _recoverFile =
//               File(SystemConfig.appUserProfileDirectory + '/' + _fileName);
//           await File(element.path).copy(_recoverFile.path);
//         });

//         // ---- Load databasedata into memory----------
//         // final _restoreDataDirectory =
//         //     Directory(SystemConfig.appDirectory + '/restore/db');
//         // var _dataFileList = _restoreDataDirectory.list();
//         // _dataFileList.forEach((element) async {
//         //   print(element.path);
//         // });
//         //----Database restoration-----------

//         String _userProfileData = await File(SystemConfig.appDirectory +
//                 '/restore/db/userProfileDataBackup.txt')
//             .readAsString();

//         String _settingsData = await File(SystemConfig.appDirectory +
//                 '/restore/db/settingsDataBackup.txt')
//             .readAsString();

//         String _shiftData = await File(
//                 SystemConfig.appDirectory + '/restore/db/shiftDataBackup.txt')
//             .readAsString();
//         List<String> _shiftDataListStringType = _shiftData.split('/');
//         _shiftDataListStringType.removeAt(0);
//         List<Shift> _shiftDataList = [];
//         for (var element in _shiftDataListStringType) {
//           _shiftDataList.add(
//             Shift.fromMap(
//               json.decode(element),
//             ),
//           );
//         }

//         String _documentData = await File(SystemConfig.appDirectory +
//                 '/restore/db/documentDataBackup.txt')
//             .readAsString();
//         List<String> _shiftDocumentListStringType = _documentData.split('/');
//         _shiftDocumentListStringType.removeAt(0);
//         List<ShiftDocument> _shiftDocumentList = [];
//         for (var element in _shiftDocumentListStringType) {
//           _shiftDocumentList.add(
//             ShiftDocument.fromMap(
//               json.decode(element),
//             ),
//           );
//         }

//         BackupRestoreService _backupRestoreService = new BackupRestoreService();
//         _backupRestoreService.restoreDatabase(
//           shiftList: _shiftDataList,
//           documentList: _shiftDocumentList,
//           user: json.decode(_userProfileData),
//           settings: json.decode(_settingsData),
//         );
//         isLoading = false;
//         notifyListeners();
//       } catch (e) {
//         print(e);
//       }
//       isLoading = false;
//       notifyListeners();
//     } else {
//       print('file not available');
//       isLoading = false;
//       notifyListeners();
//     }
//     isLoading = false;

//     notifyListeners();
//   }
// }
