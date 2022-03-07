import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/todo_model.dart';
import '../service/ITodo_service.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodosState> {
  TodoCubit(this.todoService) : super(TodosInitial()) {
    getDatas();
  }

  ITodoService? todoService;
  List<TodoModel>? model;
  int? listCount = 0;
  Future<void> getDatas() async {
    emit(TodosLoading());
    final model = await todoService?.getTodos();
    listCount = model?.length;
    emit(TodosCompleted(model));
  }
}
