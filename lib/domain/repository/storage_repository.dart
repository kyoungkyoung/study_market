import 'dart:io';

import 'package:study_market/core/result.dart';

abstract class StorageRepository {
  Future<Result> uploadFile(File file);

}