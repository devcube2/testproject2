void main() {
  int a = 2;
  int b = 1;
  print(a+b); // 3

  String firstName = 'Jeongjoo';
  String lastName = 'Lee';
  String fullName = lastName + ' ' + firstName;
  print(fullName); // 'Lee Jeongjoo'

  print('-------------------');
  int a2 = 2;
  int b2 = 1;
  print(a - b); // 1

  print('-------------------');
  int a3 = 2;
  print(-a3); // -2

  print('-------------------');
  int a4 = 6;
  int b4 = 3;
  print(a2 * b2);
  print('*' * 5); // *****

  print('-------------------');
  int a5 = 10;
  int b5 = 4;
  print(a / b); // 2.5

  print('-------------------');
  int a6 = 10;
  int b6 = 4;
  print(a6 ~/ b6); // 2

  print('-------------------');
  int a7 = 10;
  int b7 = 4;
  print(a7 % b7); // 2

  print('-------------------');
  int a8 = 0;
  print(++a8);
  print(a8); // 1

  print('-------------------');
  int a9 = 0;
  print(a9++); // 0
  print(a9); // 1

  print('-------------------');
  int b10 = 1;
  print(--b); // 0
  print(b); // 0

  print('-------------------');
  int b11 = 1;
  print(b11--); // 0
  print(b11); // 0

  print('-------------------');
  int a12 = 2;
  int b12 = 1;
  print(a == b); // false

  print('-------------------');
  int a13 = 2;
  int b13 = 1;
  print(a != b); // true

  print('-------------------');
  int a14 = 2;
  int b14 = 1;
  print(a14 > b14); // true

  print('-------------------');
  int a15 = 2;
  int b15 = 1;
  print(a15 < b15); // false

  print('-------------------');
  int a16 = 2;
  int b16 = 1;
  print(a >= b); // true

  print('-------------------');
  int a17 = 2;
  int b17 = 2;
  print(a <= b); // true

  print('-------------------');
  int a18 = 1; // 할당
  print(a18);
  a18 = 2; // 재할당
  print(a18);

  print('-------------------');
  a *= 3; // a = a * 3
  print(a);

  print('-------------------');
  int a19 = 2;
  int b19 = 1;
  bool result = a19 > b19; // true
  print(!result); // false

  print('-------------------');
  int a20 = 3;
  int b20 = 2;
  int c20 = 1;
  print(a20 > b20); // true
  print(b20 < c20); // false
  print(a20 > b20 || b20 < c20); // true

  print('-------------------');
  int a21 = 3;
  int b21 = 2;
  int c21 = 1;
  print(a21 > b21); // true
  print(b21 < c21); // false
  print(a21 > b21 && b21 < c21); // false
}