import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/todo_cubit.dart';

class CustomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ToDo'),
        ),
        body: MainMonitor(),
      ),
    );
  }
}

class MainMonitor extends StatefulWidget {
  const MainMonitor({Key? key}) : super(key: key);

  @override
  State<MainMonitor> createState() => _MainMonitorState();
}

class _MainMonitorState extends State<MainMonitor> {
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.ToDoList.length,
                    itemBuilder: (context, indexNumber) => ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${indexNumber + 1}) ${state.ToDoList[indexNumber]}',
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<TodoCubit>(context)
                                  .remove(indexNumber);
                            },
                            child: const Text('Remove'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: t1,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodoCubit>(context).add(t1.text);
                t1.clear();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
