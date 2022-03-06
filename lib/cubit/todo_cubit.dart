import 'package:bloc/bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState(ToDoList: []));

  void add(String text) {
    print(state.ToDoList);
    emit(TodoState(ToDoList: List.from([...state.ToDoList, text])));
  }

  void remove(int indexNumber) {
    print(state.ToDoList);
    emit(TodoState(ToDoList: state.ToDoList..removeAt(indexNumber)));
  }
}
