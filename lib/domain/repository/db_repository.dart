import 'package:study_market/core/result.dart';

abstract class DbRepository {
  Future<Result> insert(Map<String, dynamic> json);
}