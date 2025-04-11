import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Write extends StatefulWidget {
  @override
  _WriteState createState() {
    return _WriteState();
  }
}

class _WriteState extends State<Write> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Dio dio = Dio();

  void bookSave() async {
    try {
      final sendData = {
        "title": titleController.text,
        "author": authorController.text,
        "description": descController.text,
        "password": passwordController.text
      };
      final response = await dio.post(
        "http://localhost:8080/task8/book",
        data: sendData,
      );
      final data = response.data;
      if (data != null) {
        Navigator.pushNamed(context, "/");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("책 등록 화면")),
      body: Center(
        child: Column(
          children: [
            Text("책을 등록 해보세요."),
            SizedBox(height: 30),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "책 제목"),
              maxLength: 30,
            ),
            SizedBox(height: 30),
            TextField(
              controller: authorController,
              decoration: InputDecoration(labelText: "책 저자"),
              maxLength: 30,
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "책 소개"),
              maxLength: 30,
            ),
            SizedBox(height: 30),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "비밀번호"),
              maxLength: 30,
            ),
            SizedBox(height: 30),
            OutlinedButton(onPressed: bookSave, child: Text("등록하기")),
          ], // 위젯들 end
        ), // column end
      ), // center end
    ); // scaffold end
  } // build end
} // class end
