import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_market/presentation/add/add_screen.dart';
import 'package:study_market/presentation/add/add_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공부 자료 커뮤니티'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider<AddViewModel>(
                create: (context) => AddViewModel(),
                child: const AddScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
