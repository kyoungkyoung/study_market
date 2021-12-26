import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_market/domain/model/doc.dart';
import 'package:study_market/presentation/add/add_screen.dart';
import 'package:study_market/presentation/home/components/doc_widget.dart';
import 'package:study_market/presentation/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      viewModel.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('공부 자료 커뮤니티'),
      ),
      body: _buildBody(viewModel.items),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  // ChangeNotifierProvider<AddViewModel>(
                // create: (context) => AddViewModel(UploadUseCase(
                //     FirestoreDbRepository(), FirebaseStorageRepository()
                // )),
                // child:
                const AddScreen(),
              // ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(List<Doc> docs) {
    return ListView.builder(
        itemCount: docs.length,
        itemBuilder: (context, index) {
      Doc doc = docs[index];
      return DocWidget(doc: doc);
    });
  }
}
