class Player {
  final String name; // class property
  int xp, age;
  String team;

  Player({
    required this.name,
    this.xp = 0,
    required this.team,
    required this.age,
  });

  Player.createSeoulPlayer({
    // named constructor syntax
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'Seoul',
        this.xp = 0;

  Player.createBusanPlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'Busan',
        this.xp = 0;
}

void main(List<String> args) {
  var p1 = Player.createSeoulPlayer(
    name: "Jimmy",
    age: 30,
  );
  var p2 = Player.createBusanPlayer(
    name: "Jeongmin",
    age: 30,
  );
}
