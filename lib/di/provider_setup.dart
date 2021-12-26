import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:study_market/data/repository/firebase_storage_repository.dart';
import 'package:study_market/data/repository/firestore_db_repository.dart';
import 'package:study_market/domain/use_case/fetch_use_case.dart';
import 'package:study_market/domain/use_case/upload_use_case.dart';
import 'package:study_market/presentation/add/add_view_model.dart';
import 'package:study_market/presentation/home/home_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final dbRepository = FirestoreDbRepository();

  final uploadUseCase = UploadUseCase(dbRepository, FirebaseStorageRepository());
  final fetchUseCase = FetchUseCase(dbRepository);

  return [
    ChangeNotifierProvider<AddViewModel>(create: (context) => AddViewModel(uploadUseCase)),
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel(fetchUseCase)),
  ];
}