class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player(
      {required this.name,
      this.xp = 0,
      required this.team,
      required this.age}); // use named parameter on constructor
}

void main(List<String> args) {
  var p1 = Player(
    name: "Jimmy",
    team: "Seoul",
    age: 30,
  );
  var p2 = Player(
    name: "Jeongmin",
    team: "Busan",
    age: 30,
  );
}
