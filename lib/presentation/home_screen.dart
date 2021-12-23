import 'package:flutter/material.dart';
import 'package:study_market/presentation/add_screen.dart';

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
            MaterialPageRoute(builder: (context) => const AddScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
