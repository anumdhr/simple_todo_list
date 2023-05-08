

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController todoList = TextEditingController();
  List<Todo> todo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
            ),
            const Text(
              "TO DO LIST",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                child: Image.asset("assets/images/Ellipse 27.png"),
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              onChanged: (value) {
                setState(() {
                  todo[index].isChecked = !todo[index].isChecked;
                });
              },
              value: todo[index].isChecked,
            ),
            title: Text(todo[index].title),
            trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    todo.removeAt(index);
                  });
                },
                child: const Icon(Icons.delete)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: todoList,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                              color: Colors.red,
                            ))),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          todo.add(
                            Todo(title: todoList.text),
                          );
                        });
                        todoList.clear();
                      },
                      child: const Text(
                        "Enter",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  String title;
  bool isChecked;

  Todo({required this.title, this.isChecked = false});
}
