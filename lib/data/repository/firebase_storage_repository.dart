import 'dart:io';
import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:study_market/core/result.dart';
import 'package:study_market/domain/repository/storage_repository.dart';

class FirebaseStorageRepository implements StorageRepository {
  @override
  Future<Result<String>> uploadFile(File file) async {
    //얘는 upload를 수행하는게 아니고 upload를 수행하기 위한 코드
    UploadTask task = FirebaseStorage.instance.ref('uploads/${basename(file.path)}').putFile(file);

      try {
        TaskSnapshot snapshot = await task;
        String downloadUrl = await snapshot.ref.getDownloadURL();

        return Result.success(downloadUrl);
    } on FirebaseException catch (e) {
        return const Result.error('업로드에 실패했습니다.');

    }
  }
}
