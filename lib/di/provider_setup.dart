import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:study_market/data/repository/firebase_storage_repository.dart';
import 'package:study_market/data/repository/firestore_db_repository.dart';
import 'package:study_market/domain/use_case/upload_use_case.dart';
import 'package:study_market/presentation/add/add_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final usecase = UploadUseCase(FirestoreDbRepository(), FirebaseStorageRepository());

  return [
    ChangeNotifierProvider<AddViewModel>(create: (context) => AddViewModel(usecase)),
  ];
}