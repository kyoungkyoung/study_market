import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:study_market/presentation/add/add_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  return [
    // ChangeNotifierProvider<AddViewModel>(create: (context) => AddViewModel()),
  ];
}