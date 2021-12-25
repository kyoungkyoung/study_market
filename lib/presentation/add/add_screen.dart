import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/src/provider.dart';
import 'package:study_market/presentation/add/add_view_model.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (viewModel.fileName.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('파일을 선택하세요')),
            );
          }
          viewModel.upload();
        },
        child: const Icon(Icons.upload),
      ),
      appBar: AppBar(),
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null && result.files.single.path != null) {
                  viewModel.setFileName(result.files.single.path!);
              } else {
                viewModel.setFileName(null);
              }
            },
            child: const Text('파일 선택'),
          ),
          Text(viewModel.fileName),
        ],
      ),
    );
  }
}
