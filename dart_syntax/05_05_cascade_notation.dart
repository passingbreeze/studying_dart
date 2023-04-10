class Player {
  String name, team; // class property
  int xp, age;

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

  void yourTeamIs() => print(team);
}

void main(List<String> args) {
  var jeongmin = Player(name: 'Jeongmin', team: 'Jeju', age: 30)
    ..name = 'jimmy' // cascade Notation
    ..team = 'dokdo'
    ..age = 0
    ..yourTeamIs();
}
