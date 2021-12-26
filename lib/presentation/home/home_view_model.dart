import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_market/domain/model/doc.dart';
import 'package:study_market/domain/use_case/fetch_use_case.dart';

class HomeViewModel with ChangeNotifier {
  final FetchUseCase _fetchUseCase;

  List<Doc> _items = [];

  //접근은 되는데 접근하면 죽임
  UnmodifiableListView<Doc> get items => UnmodifiableListView(_items);

  HomeViewModel(this._fetchUseCase);

  Future<void> fetch() async {
    final result = await _fetchUseCase.fetch();

    result.when(success: (items) {
      _items = items;
      notifyListeners();
    }, error: (message) {
      print(message);
    });
  }
}
