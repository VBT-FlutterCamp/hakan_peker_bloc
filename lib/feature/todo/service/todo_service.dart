
import 'package:dio/dio.dart';

import '../model/todo_model.dart';
import 'ITodo_service.dart';

class TodoService extends ITodoService {
  TodoService(Dio dio) : super(dio);
  @override
  Future<List<TodoModel>?> getTodos() async {
    final response = await dio.get(ITodoServicePath.TODO.rawValue);

    if (response.statusCode == 200) {
      final data = response.data as List;

      return data.map((e) => TodoModel.fromJson(e)).toList();
    }
  }
}
