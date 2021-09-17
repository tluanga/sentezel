import 'dart:convert';
import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/new_transaction/common/transaction_config.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart' as trans;
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/business_profile/business_profile_config.db.dart';
import 'package:sentezel/settings/business_profile/business_profile_repository.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_config.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/restore/restore_model.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';
import 'package:sentezel/setup/system_config.dart';
import 'package:sqflite/sqflite.dart';

final restoreControllerProvider =
    StateNotifierProvider<RestoreController, Restore>(
        (ref) => RestoreController(ref.read));

class RestoreController extends StateNotifier<Restore> {
  final Reader _read;
  RestoreController(this._read)
      : super(
          Restore(
            backupFileIsPicked: false,
            backupFilePath: '',
          ),
        );

  restore() async {
    //----------Clear the database-------------
    await _read(ledgerMasterRepositoryProvider).clear();
    await _read(transactionRepositoryProvider).reset();
    await _read(transactionCategoryRepositoryProvider).clear();

    Database db = await DatabaseService.instance.db;
    final restoreDirectory = Directory(SystemConfig.appDirectory + 'restore');
    final zipFile = await File(state.backupFilePath)
        .copy(SystemConfig.appDirectory + '/backupFile.zip');

    var zipFileStatus = await zipFile.exists();
    try {
      //--extract the zip file
      await ZipFile.extractToDirectory(
          zipFile: zipFile,
          destinationDir: restoreDirectory,
          onExtracting: (zipEntry, progress) {
            print('progress: ${progress.toStringAsFixed(1)}%');
            print('name: ${zipEntry.name}');
            print('isDirectory: ${zipEntry.isDirectory}');
            print('uncompressedSize: ${zipEntry.uncompressedSize}');
            print('compressedSize: ${zipEntry.compressedSize}');
            print('compressionMethod: ${zipEntry.compressionMethod}');
            print('crc: ${zipEntry.crc}');
            return ZipFileOperation.includeItem;
          });
      //--delete the zip file
      zipFile.delete();
      // state.isZipFileAvailable = false;

      //____________RESTORE LEDGER MASTER___________________
      final _ledgerMasterData = await File(SystemConfig.appDirectory +
              '/restore/db/ledgerMasterDataBackup.txt')
          .readAsString();

      List<String> _ledgerMasterDataStringType = _ledgerMasterData.split('/');
      _ledgerMasterDataStringType.removeAt(0);
      List<LedgerMaster> _ledgerMasterDataList = [];
      for (var element in _ledgerMasterDataStringType) {
        _ledgerMasterDataList.add(
          LedgerMaster.fromMap(
            json.decode(element),
          ),
        );
      }
      //--Insert into database
      for (var element in _ledgerMasterDataList) {
        try {
          db.insert(LedgerMasterConfig.dbName, element.toMap());
        } catch (e) {
          print(e);
        }
      }
      print('Restore of Ledger Master Completed');
      //____________RESTORE TRANSACTION___________________
      final _transactionData = await File(SystemConfig.appDirectory +
              '/restore/db/transactionDataBackup.txt')
          .readAsString();
      if (_transactionData.isNotEmpty) {
        List<String> _transactionDataStringType = _transactionData.split('/');
        _ledgerMasterDataStringType.removeAt(0);
        List<trans.Transaction> _transactionDataList = [];
        for (var element in _transactionDataStringType) {
          _transactionDataList.add(
            trans.Transaction.fromJson(
              json.decode(element),
            ),
          );
        }
        //--Insert into database
        for (var element in _transactionDataList) {
          db.insert(TransactionConfig.dbName, element.toJson());
        }
      }

      print('Restore of Transaction Completed');

      //____________ TRANSACTION CATEGORY___________________
      final _transactionCategoryData = await File(SystemConfig.appDirectory +
              '/restore/db/transactionCategoryDataBackup.txt')
          .readAsString();

      List<String> _transactionCategoryDataStringType =
          _transactionCategoryData.split('/');
      _transactionCategoryDataStringType.removeAt(0);
      List<TransactionCategory> _transactionCategoryDataList = [];
      for (var element in _transactionCategoryDataStringType) {
        _transactionCategoryDataList.add(
          TransactionCategory.fromJson(
            json.decode(element),
          ),
        );
      }
      //--Insert into database
      for (var element in _transactionCategoryDataList) {
        db.insert(TransactionConfig.dbName, element.toJson());
      }
      print('Restore of Transaction Category Completed');

      //____________ BUSINESS PROFILE___________________
      final _businessProfileData = await File(SystemConfig.appDirectory +
              '/restore/db/businessProfileDataBackup.txt')
          .readAsString();
      final _businessProfileDataConverted = json.decode(_businessProfileData);

      //--Insert into database
      _read(businessProfileRepository).add(_businessProfileDataConverted);
    } catch (e) {
      print(e);
    }
  }

  setState(Restore restore) {
    print(restore);
    state = state.copyWith(
      backupFileIsPicked: restore.backupFileIsPicked,
      backupFilePath: restore.backupFilePath,
    );
  }
}
