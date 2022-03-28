import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/Classes/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
  ];

  final ScrollController _sc = ScrollController();
  final TextEditingController _tc = TextEditingController();
  final FocusNode _fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To do',
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFD96262),
      body: appBody(),
    );
  }

  SafeArea appBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _sc,
                child: listView(),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _tc,
              focusNode: _fn,
              maxLines: 2,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                prefix: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.black),
                  onPressed: () {
                    _tc.text = '';
                    _fn.unfocus();
                  },
                ),
                suffix: IconButton(
                  icon: const Icon(Icons.done, color: Colors.black),
                  onPressed: () {
                    addTodo(_tc.text);
                    _tc.text = '';
                    _fn.unfocus();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(todos[index].id.toString()),
            ),
            title: Text(
              todos[index].details,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMEd().format(todos[index].created),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    removeTodo(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    removeTodo(index);
                  },
                ),
              ],
            )),
      ),
    );
  }

  addTodo(String details) {
    int index = 1;
    if (todos.isEmpty) {
      index = 1;
    } else {
      index = todos.last.id + 1;
    }

    if (mounted) {
      setState(() {
        todos.add(Todo(details: details, id: index));
      });
    }
  }

  removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
