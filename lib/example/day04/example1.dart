import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: "/", // 최초로 실행 했을때 열리는 경로
        routes: {
          "/" : (context) => Home(),
          "/page1" : (context) => Page1(),
        },
      )
  );
}

// 2-1 앱 화면 만들기. 2가지 선택사항 : 1. 상태없는 : StatelessWidget , 2. 상태있는 : StatefulWidget
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메인페이지 헤더")),
      body: Center(
        child: Column(
          children: [
            Text("메인페이지 본문"),
            TextButton(
                onPressed: ()=>{Navigator.pushNamed(context, "/page1")},
                child: Text("page1 로 이동 버튼")
            )
          ],
        )
      )
    );
  }
}

// 2-2 앱 화면 만들기. 2가지 선택사항 : 1. 상태없는 : StatelessWidget , 2. 상태있는 : StatefulWidget
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("PAGE1 헤더")),
        body: Center(child: Text("PAGE1 본문"))
    );
  }
}