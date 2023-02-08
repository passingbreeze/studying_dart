class Strong {
  // no constructor -> this class can be used in mixins!
  final double strengthLevel = 1500.99;
}

class QuickRunner {
  void runQuick() => print("ruuuuun!");
}

class Tall {
  final double height = 1.99;
}

enum Team { Seoul, Busan }

class Player with Strong, QuickRunner, Tall {
  // mixins
  final Team team;
  Player({
    required this.team,
  });
}

void main(List<String> args) {
  var player = Player(
    team: Team.Busan,
  );
  player.runQuick();
}
