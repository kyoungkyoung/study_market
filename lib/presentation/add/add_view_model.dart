import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:study_market/data/repository/firebase_storage_repository.dart';
import 'package:study_market/data/repository/firestore_db_repository.dart';
import 'package:study_market/domain/model/doc.dart';
import 'package:path/path.dart';
import 'package:study_market/domain/use_case/upload_use_case.dart';
import 'package:study_market/presentation/add/add_screen_ui_event.dart';

class AddViewModel with ChangeNotifier {
  String? _fileName;

  String get fileName => _fileName != null ? basename(_fileName!) : '';

  final _eventController = StreamController<AddScreenUiEvent>.broadcast();
  Stream<AddScreenUiEvent> get eventStream => _eventController.stream;

  final UploadUseCase _uploadUseCase;

  AddViewModel(this._uploadUseCase);

  void setFileName(String? newFileName) {
    _fileName = newFileName;
    notifyListeners();
  }

  void init() {
    _fileName = null;
  }

  void destroy() {
    _fileName = null;
  }

  void upload() async {
    if (_fileName == null) {
      return;
    }
    final result = await _uploadUseCase.excute(_fileName!);

    result.when(
      success: (message) {
        _eventController.add(const AddScreenUiEvent.success());
      },
      error: (message) {
        _eventController.add(AddScreenUiEvent.showSnackBar(message));
      },
    );
  }
}
