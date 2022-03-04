import 'package:bloc/bloc.dart';

part 'todo_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(ToDoList: [] ));

  void add() => emit(CounterState(ToDoList:  state.add(t1.text); t1.clear()));
}