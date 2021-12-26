import 'package:study_market/core/result.dart';
import 'package:study_market/domain/model/doc.dart';
import 'package:study_market/domain/repository/db_repository.dart';

class FetchUseCase {
  final DbRepository _dbRepository;

  FetchUseCase(this._dbRepository);

  Future<Result<List<Doc>>> fetch() async {
    return _dbRepository.fetch();
  }
}