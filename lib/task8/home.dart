import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Dio dio = Dio();
  List<dynamic> bookList = [];
  
  void bookFindAll() async {
    try {
      final response = await dio.get("http://localhost:8080/task8/book");
      final data = response.data;
      setState(() {
        bookList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    bookFindAll();
  }

  void bookDelete(int bookId) async {
    String? password = await showPasswordDialog(context);

    if (password != null) {
      print("입력된 비밀번호: $password");
    }

    try {
      final response = await dio.delete("http://localhost:8080/task8/book?id=$bookId&password=$password");
      if ( response.data == true ) {
        bookFindAll();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> showPasswordDialog(BuildContext context) async {
    TextEditingController _passwordController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('비밀번호 입력'),
          content: TextField(
            controller: _passwordController,
            obscureText: true, // 비밀번호 숨김
            decoration: InputDecoration(
              labelText: '비밀번호',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // 취소
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, _passwordController.text); // 입력값 리턴
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메인 페이지 : book")),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, "/write")},
              child: Text("책추천 등록"),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children:
                    bookList.map((book) {
                      return Card (
                        child: ListTile(
                          title: Text(book['title']),
                          subtitle: Column(
                            children: [
                              Text("저자 : ${book['author']}"),
                              Text("책소개 : ${book['description']}"),
                            ],
                          ),
                          trailing : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: ()=>{ Navigator.pushNamed(context, "/update", arguments: book['bookId'])},
                                  icon: Icon(Icons.edit)
                              ),
                              IconButton(
                                  onPressed: ()=>{ Navigator.pushNamed(context, "/detail", arguments: book['bookId'])},
                                  icon: Icon(Icons.info)
                              ),
                              IconButton(
                                  onPressed: () => { bookDelete(book['bookId']) },
                                  icon: Icon(Icons.add_a_photo)
                              )
                            ],
                          )
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
