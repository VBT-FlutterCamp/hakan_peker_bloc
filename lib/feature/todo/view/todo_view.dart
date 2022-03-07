import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/ITodo_service.dart';
import '../service/todo_service.dart';
import '../viewModel/todo_cubit.dart';
import '../viewModel/todo_state.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(TodoService(Dio(BaseOptions(baseUrl: ITodoServicePath.URL.rawValue)))),
      child: BlocConsumer<TodoCubit, TodosState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.watch<TodoCubit>().listCount.toString()),
            ),
            body: _buildListviewBuilder(state),
          );
        },
      ),
    );
  }

  Widget _buildListviewBuilder(TodosState state) {
    if (state is TodosCompleted) {
      return ListView.builder(
        itemCount: state.items?.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(state.items?[index].title.toString() ?? ""),
              subtitle: Text(state.items?[index].userId.toString() ?? ""),
              trailing: CircleAvatar(child: Text(state.items?[index].id.toString() ?? "")),
            ),
          );
        },
      );
    } else if (state is TodosLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Text("error");
    }
  }
}
