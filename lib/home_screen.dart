import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  List todoList = [];
  int? indexOfEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    onSubmitted: (value) {
                      // todoList.add(value);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if(indexOfEdit!=null){
                      setState(() {
                        todoList[indexOfEdit!] = textEditingController.text;
                        indexOfEdit = null;
                      });


                    }else{
                      setState(() {
                        todoList.add(textEditingController.text);
                      });
                    }


                    textEditingController.clear();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(child: Text(todoList[index].toString())),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              indexOfEdit = index;
                              textEditingController.text = todoList[index];
                            });

                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            todoList.removeAt(index);
                            setState(() {

                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}