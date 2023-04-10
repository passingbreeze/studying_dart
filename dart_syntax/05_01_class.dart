class Player {
  final String name = "jimmy"; // class 변수는 var를 쓸 수 없다
  int exp = 0;
  void sayHello() {
    print("Hello! My name is $name"); // this.name이라고 표현할 필요없음.
    // 단, 메소드 지역변수 이름과 사용하고자 하는 클래스 변수이름이 같으면 this를 클래스 변수에 써서 구분해줘야한다.
  }
}

void main(List<String> args) {
  var player = Player();
  print(player.name);
  print(player.exp);
  player.sayHello();
}
