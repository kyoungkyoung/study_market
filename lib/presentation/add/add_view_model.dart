import 'dart:io';

import 'package:flutter/material.dart';
import 'package:study_market/data/repository/firebase_storage_repository.dart';
import 'package:study_market/data/repository/firestore_db_repository.dart';
import 'package:study_market/domain/model/doc.dart';
import 'package:path/path.dart';
import 'package:study_market/domain/use_case/upload_use_case.dart';

class AddViewModel with ChangeNotifier {
  String? _fileName;

  String get fileName => _fileName != null ? basename(_fileName!) : '';

  final _uploadUseCase = UploadUseCase(
    FirestoreDbRepository(),
    FirebaseStorageRepository(),
  );

  void setFileName(String? newFileName) {
    _fileName = newFileName;
    notifyListeners();
  }

  void upload() {
    if (_fileName == null) {
      return;
    }
    _uploadUseCase.excute(_fileName!);
  }
}
