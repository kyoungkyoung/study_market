import 'package:study_market/core/result.dart';
import 'package:study_market/domain/model/doc.dart';

abstract class DbRepository {
  Future<Result> insert(Map<String, dynamic> json);
  Future<Result<List<Doc>>> fetch();
}