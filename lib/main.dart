import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/splash_screen.dart';
//import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',

      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final _timeController = TextEditingController();
  List<Map<String, dynamic>> _todos = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
title: Text("ToDo Buddy",
style: TextStyle(fontWeight: FontWeight.w900,
      color: Colors.white,

),
),
        elevation: 15,
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),

          ),

        ),
        shadowColor: Color(0xFF33B798),
        backgroundColor: Color(0xFD208A8A),

        automaticallyImplyLeading: false,


      ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter Todo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0), // add 16px space between TextFields
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Enter Date',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _dateController.text.isEmpty
                        ? DateTime.now()
                        : DateFormat.yMd().parse(_dateController.text),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  if (picked!= null) {
                    setState(() {
                      _dateController.text = DateFormat.yMd().format(picked);
                    });
                  }
                },
              ),
              SizedBox(height: 16.0), // add 16px space between TextFields
              TextField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: 'Enter Time',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: _timeController.text.isEmpty
                        ? TimeOfDay.now()
                        : TimeOfDay(hour: int.parse(_timeController.text.split(':')[0]), minute: int.parse(_timeController.text.split(':')[1])),
                  );
                  if (picked!= null) {
                    setState(() {
                      _timeController.text = '${picked.hour}:${picked.minute}';
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_controller.text == '' || _dateController.text == '' || _timeController.text == '') {
                      Fluttertoast.showToast(
                        msg: 'Enter todo, date and time',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Color(0xFD208A8A),
                        textColor: Colors.white,
                      );
                    } else {
                      _todos.add({'todo': _controller.text, 'date': _dateController.text, 'time': _timeController.text});
                      _controller.clear();
                      _dateController.clear();
                      _timeController.clear();
                    }
                  });
                },
                child: Text('New Task',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Color(0xFD2FFFFF)),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_todos[index]['todo']),
                      subtitle: Text('${_todos[index]['date']} at ${_todos[index]['time']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Color(0xFD208A8A),),
                        onPressed: () {
                          setState(() {
                            _todos.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}



  // Initialize date formatting data for the 'en_US' locale




