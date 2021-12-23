import 'package:study_market/core/result.dart';
import 'package:study_market/domain/repository/db_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbRepository implements DbRepository {
  CollectionReference _docs = FirebaseFirestore.instance.collection('docs');

  @override
  Future<Result> insert(Map<String, dynamic> json) async {
    try {
      await _docs.add(json);
      return const Result.success('DB insert 성공');
    } on Exception catch (e) {
      return const Result.error('DB insert 실패');
    }
  }
}
