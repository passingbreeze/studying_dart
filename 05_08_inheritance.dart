class Human {
  final String name;
  Human({required this.name});
  void sayHello() => print("Hi! my name is $name");
}

enum Team { Seoul, Busan }

class Player extends Human {
  final Team team;
  Player({
    required this.team,
    required String name,
  }) : super(name: name);

  @override
  void sayHello() {
    super.sayHello();
    print('I play for ${team}');
  }
}

void main(List<String> args) {
  var player = Player(team: Team.Busan, name: 'jimmy');
  player.sayHello();
}
