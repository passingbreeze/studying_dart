class Player {
  final String name;
  int xp;

  Player(this.name, this.xp); // constructor 잘 활용하는 방법

  // * 기본
  // late final String name; // constructor로 클래스 변수에 값을 주려면 late를 써야한다.
  // late int exp;

  // Player(String name, int exp) {
  //   // dart constructor
  //   this.name = name;
  //   this.exp = exp;
  // }
}

void main(List<String> args) {
  var p1 = Player("jimmy", 0);
  var p2 = Player("jeongmin", 1000);
}
