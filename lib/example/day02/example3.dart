void main() {
  int number = 31;
  if (number % 2 == 1) {
    print("홀수!");
  } else {
    print("짝수!");
  }

  String light = "red";
  if (light == "green") {
    print("초록불!");
  } else if (light == "yellow") {
    print("노란불!");
  } else if (light == "red") {
    print("빨간불!");
  } else {
    print("잘못된 신호입니다.");
  }

  String light2 = "purple";
  if (light2 == "green") {
    print("초록불!");
  } else if (light2 == "yellow") {
    print("노란불!");
  } else if (light2 == "red") {
    print("빨간불!");
  }

  for (int i = 0; i < 100; i++) {
    print(i+1);
  }

  List<String> subjects = ["자료구조", "이산수학", "알고리즘", "플러터"];
  for (String subject in subjects) {
    print(subject);
  }

  int i = 0;
  while (i < 100) {
    print(i+1);
    i = i + 1;
  }

  // 무한루프라 주석처리
  // i = 0;
  // while (true) {
  //   print(i+1);
  //   i = i + 1;
  // }

  i = 0;
  while (true) {
    print(i+1);
    i = i + 1;
    if (i == 100) {
      break;
    }
  }

  for (int i = 0; i < 100; i++) {
    if (i % 2 == 0) {
      continue;
    }
    print(i+1);
  }

  number = add(1, 2);
  print(number);

  switch (number) {
    case 1:
      print('one');
  }

  const a = 'a';
  const b = 'b';
  var obj = ['a', 'b'];
  switch (obj) {
    case [a, b]:
      print('$a, $b');
  }

  var obj2 = 3;
  switch (obj2) {
    // Matches if 1 == obj.
    case 1:
      print('one');
    case >= 2 && <= 5:
      print('in range');
    // Matches if obj is a record with two fields, then assigns the fields to 'a' and 'b'
    case (var a, var b):
      print('a = $a, b = $b');
    default:

  }
}

int add(int a, int b) {
  return a+b;
}