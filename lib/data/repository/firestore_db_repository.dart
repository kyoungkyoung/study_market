import 'package:study_market/core/result.dart';
import 'package:study_market/domain/model/doc.dart';
import 'package:study_market/domain/repository/db_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbRepository implements DbRepository {
  final _docs = FirebaseFirestore.instance.collection('docs').withConverter<Doc>(
      fromFirestore: (snapshot, _) => Doc.fromJson(snapshot.data()!),
      toFirestore: (doc, _) => doc.toJson(),);

  @override
  Future<Result> insert(Map<String, dynamic> json) async {
    try {
      await _docs.add(Doc.fromJson(json));
      return const Result.success('DB insert 성공');
    } on Exception catch (e) {
      return const Result.error('DB insert 실패');
    }
  }

  @override
  Future<Result<List<Doc>>> fetch() async {
    Future.delayed(const Duration(milliseconds: 500));
    try{
      final QuerySnapshot<Doc> querySnapshot = await _docs.get();
      return Result.success(querySnapshot.docs.map((e) => e.data()).toList());
    } on Exception catch (e) {
      return const Result.error('DB fetch 실패');
    }
  }
}
