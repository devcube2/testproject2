import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() {
    return _DetailState();
  }
}

class _DetailState extends State<Detail> {
  Dio dio = Dio();
  Map<String, dynamic> book = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int id = ModalRoute.of(context)!.settings.arguments as int;
    bookFindById(id);
  }

  void bookFindById(id) async {
    try {
      final response = await dio.get(
        "http://localhost:8080/task8/book/view?id=$id",
      );
      setState(() {
        book = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세 화면")),
      body: Center(
        child: Column(
          children: [
            Text("제목: ${book['title']}", style: TextStyle(fontSize: 25)),
            SizedBox(height: 8),

            Text("저자: ${book['author']}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),

            Text("소개: ${book['description']}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
