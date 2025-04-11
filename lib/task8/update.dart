import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() {
    return _UpdateState();
  }
}

class _UpdateState extends State<Update> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int _bookId = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bookId = ModalRoute.of(context)!.settings.arguments as int;
    bookFindById(_bookId);
  }

  Dio dio = Dio();
  Map<String, dynamic> book = {};
  void bookFindById(int id) async {
    try {
      final response = await dio.get("http://localhost:8080/task8/book/view?id=$id");
      setState(() {
        book = response.data;
        titleController.text = book['title'];
        authorController.text = book['author'];
        descController.text = book['description'];
      });
    } catch(e) {
      print(e);
    }
  }

  void bookUpdate() async {
    try {
      final sendData = {
        "bookId" : _bookId ,
        "title" : titleController.text ,
        "author" : authorController.text ,
        "description" : descController.text,
        "password" : passwordController.text
      };
      final response = await dio.put("http://localhost:8080/task8/book", data : sendData);
      if (response.data != null) {
        Navigator.pushNamed(context, "/" );
      }
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("수정 화면")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "제목"),
              maxLength: 30,
            ),

            SizedBox(height: 20),
            TextField(
              controller: authorController,
              decoration: InputDecoration(labelText: "저자"),
              maxLength: 30,
            ),

            SizedBox(height: 20),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "소개"),
              maxLength: 30,
            ),

            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "비밀번호"),
              maxLength: 30,
            ),

            SizedBox(height: 20),
            OutlinedButton(
                onPressed: bookUpdate,
                child: Text("수정하기")
            )
          ],
        )
      )
    );
  }
}
