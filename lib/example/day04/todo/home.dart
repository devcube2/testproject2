import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

// dart 에서는 클래스명/변수 명앞에 _(언더바) private 뜻한다.
class _HomeState extends State<Home> {
  Dio dio = Dio();
  List<dynamic> todoList = []; // 2. 할일 목록을 저장하는 리스트 선언
  // 3. 자바와 통신 하여 할일 목록을 조회하는 함수 선언
  void todoFindAll() async {
    try {
      final response = await dio.get("https://different-silkworm-thejoeun-20dae9e2.koyeb.app/day04/todos");
      final data = response.data;
      setState(() {
        todoList = data;
      });
      print(todoList);
    } catch (e) {
      print(e);
    }
  }

  // 4. 화면 최초 열렸을때 딱 1번 실행
  @override
  void initState() {
    super.initState();
    todoFindAll();
  }

  // 5. 삭제 이벤트 함수
  void todoDelete(int id) async {
    try {
      final response = await dio.delete("https://different-silkworm-thejoeun-20dae9e2.koyeb.app/day04/todos?id=$id");
      if ( response.data == true ) {
        todoFindAll(); // 삭제 성공시 할일 목록 다시 호출 하기
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메인 페이지 : TODO")),
      body: Center(
        child: Column(
          children: [
            // (1) 등록 화면으로 이동하는 버튼
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, "/write")},
              child: Text("할일 추가"),
            ),
            // (2) 간격
            SizedBox(height: 30),
            // (3) ListView 이용한 할일 목록 출력
            // 자바로부터 가져온 할일목록을 map 함수를 이용하여 반복해서 Card 형식의 위젯 만들기
            Expanded(
              // Column 위젯 안에서 ListView
              child: ListView(
                // <ol>
                // children: [],
                children:
                    todoList.map((todo) {
                      return Card (
                        child: ListTile(
                          title: Text(todo['title']),
                          subtitle: Column(
                            children: [
                              Text("할일내용 : ${todo['content']}"),
                              Text("할일상태 : ${todo['done']}"),
                              Text("등록일 : ${todo['createAt']}"),
                            ],
                          ),
                          // trailing : ListTile 오른쪽 끝에 표시되는 위젯
                          trailing : Row( // 하위 위젯들을 가로 배치 vs Column
                            mainAxisSize: MainAxisSize.min, // 배치 방법 , 오른쪽 위젯들의 사이즈를 자동으로 할당
                            children: [
                              IconButton(
                                  onPressed: ()=>{ Navigator.pushNamed(context, "/update", arguments: todo['id'])},
                                  icon: Icon(Icons.edit)
                              ),
                              IconButton(
                                  onPressed: ()=>{ Navigator.pushNamed(context, "/detail", arguments: todo['id'])},
                                  icon: Icon(Icons.info)
                              ),
                              IconButton(
                                  onPressed: () => { todoDelete(todo['id']) },
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
