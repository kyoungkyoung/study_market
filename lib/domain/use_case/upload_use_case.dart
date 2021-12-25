import 'dart:io';

import 'package:study_market/core/result.dart';
import 'package:study_market/domain/model/doc.dart';
import 'package:study_market/domain/repository/db_repository.dart';
import 'package:study_market/domain/repository/storage_repository.dart';
import 'package:path/path.dart';

class UploadUseCase {
  final DbRepository _dbRepository;
  final StorageRepository _storageRepository;

  UploadUseCase(this._dbRepository, this._storageRepository);

  Future<Result> excute(String fileName) async {
    Result result = await _storageRepository.uploadFile(File(fileName));
    return result.when(
      success: (downloadUrl) async {
        final doc = Doc(
          fileName: basename(downloadUrl),
          downloadUrl: downloadUrl,
        );

        Result dbResult = await _dbRepository.insert(doc.toJson());
        return dbResult.when(
          success: (message) {
            return const Result.success('DB 작성 성공');
          },
          error: (message) {
            return const Result.error('DB작성 실패');
          },
        );
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
