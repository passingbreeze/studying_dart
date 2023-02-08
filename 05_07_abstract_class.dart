abstract class Human {
  void walk();
}

enum Team {
  Seoul,
  Busan,
}

enum XPLevel { newbie, people, pro }

class Player extends Human {
  final String name; // class property
  int xp, age;
  Team team;

  Player({
    required this.name,
    this.xp = 0,
    required this.team,
    required this.age,
  });

  Player.createSeoulPlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = Team.Seoul,
        this.xp = 0;

  Player.createBusanPlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = Team.Busan,
        this.xp = 0;

  void yourTeamIs() => print(team);
  void walk() => print("$name is walking!");
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
  p1.yourTeamIs(); // print Team.Seoul
  p2.yourTeamIs();
}
