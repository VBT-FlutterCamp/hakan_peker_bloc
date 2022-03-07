import 'package:dio/dio.dart';

import '../model/todo_model.dart';

abstract class ITodoService {
  final Dio dio;

  ITodoService(this.dio);
  final String path = ITodoServicePath.TODO.rawValue;

  Future<List<TodoModel>?> getTodos();
}

enum ITodoServicePath { TODO, URL }

extension ITodoServicePathExtension on ITodoServicePath {
  String get rawValue {
    switch (this) {
      case ITodoServicePath.TODO:
        return '/todos';
      case ITodoServicePath.URL:
        return 'https://jsonplaceholder.typicode.com';
    }
  }
}
