import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() {
    return _UpdateState();
  }
}

class _UpdateState extends State<Update> {
  // 1. 이전 위젯 으로 부터 전달 받은 인수를 가져 오기
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int id = ModalRoute.of(context)!.settings.arguments as int;
    print("수정: $id");
    // 전달 받은 인수(id)를 자바에게 보내고 응답 객체 받기
    todoFindById(id);
  }

  // 2.
  Dio dio = Dio();
  Map<String, dynamic> todo = {};
  void todoFindById(int id) async {
    try {
      final response = await dio.get("https://different-silkworm-thejoeun-20dae9e2.koyeb.app/day04/todos/view?id=$id");
      setState(() {
        todo = response.data;
        // 입력 컨트롤러에 초기값 대입 하기
        titleController.text = todo['title'];
        contentController.text = todo['content'];
        done = todo['done'];
      });
      print(todo);
    } catch(e) {
      print(e);
    }
  }

  void todoUpdate() async {
    try {
      final sendData = { // 전송할 내용들
        "id" : todo['id'],
        "title" : titleController.text , // 제목 ,     입력컨트롤러객체.text : 입력받은 값 반환
        "content" : contentController.text , // 내용
        "done" : done , // 상태 , 초기값
      };
      final response = await dio.put("https://different-silkworm-thejoeun-20dae9e2.koyeb.app/day04/todos", data : sendData);
      print("response: $response");
      if (response.data != null) { // 수정 성공 했으면
        Navigator.pushNamed(context, "/" ); // 라우터 이용한 "/" 메인페이지 이동
      }
    } catch(e) {
      print(e);
    }
  }

  // 3. 입력컨트롤러
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  // 완료 여부를 저장하는 상태변수
  bool done = true;

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
              controller: contentController,
              decoration: InputDecoration(labelText: "내용"),
              maxLength: 30,
            ),

            SizedBox(height: 20),
            Text("완료 여부"),
            Switch(
                value: done,
                onChanged: (value) {
                  setState(() {
                    done = value;
                  });
                }
            ),

            SizedBox(height: 20),
            OutlinedButton(
                onPressed: todoUpdate,
                child: Text("수정하기")
            )
          ],
        )
      )
    );
  }
}
