void main() {
  // p.67 레코드 , dart3 부터 추가된 타입
  // 튜플 = 값의 묶음

  // 1. 레코드 생성하는 방법1
  var record = ('first' , a : 2 , b : true , 'last');
  print(record);

  // 2. 레코드 생성하는 방법2
  (String, int) record2;
  record2 = ('유재석', 40);
  print(record2);

  // 3. 레코드의 값 호출
  print(record.$1); // key 가 존재하지 않는 value 첫번째
  print(record.a); // 'a' 라는 key의 값 반환
  print(record.b); // 'b' 라는 key의 값 반환
  print(record.$2);  // key 가 존재하지 않는 value 두번째

  // 4. JSON 형식
  var json = {'name': 'Dash', 'age': 10, 'color': 'blue'};
  print(json);
}