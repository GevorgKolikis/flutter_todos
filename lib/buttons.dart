import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/todo_cubit.dart';

class CustomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
            home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDo'),
      ),
      body: MainMonitor(),
    ),);
  }
}

class MainMonitor extends StatefulWidget {
  const MainMonitor({Key? key}) : super(key: key);

  @override
  State<MainMonitor> createState() => _MainMonitorState();
}

class _MainMonitorState extends State<MainMonitor> {
  TextEditingController t1 = TextEditingController();
  List ToDoList = [];

 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: [
          Flexible(
            child:  BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return ListView.builder(
                itemCount: ToDoList.length,
                itemBuilder: (context, indexNumber) => ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${indexNumber + 1}) ${ToDoList[indexNumber]}'),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                                    ToDoList.remove(ToDoList[indexNumber]);
                            });
                          },
                          child: Text('Remove'),
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
          SizedBox(height: 30,),







          RaisedButton(
            onPressed:                   
                      BlocProvider.of<CounterCubit>(context).Add(),
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
 
                      
                   
               
               
                    
                  
        