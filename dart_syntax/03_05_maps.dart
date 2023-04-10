void main(List<String> args) {
  var players = {
    'name': 'jimmy',
    'xp': 19.99,
    'super_power': false,
  }; // Map<String, Object>
  print(players['name']);
  // 다른언어들과는 다르게 key value에 어떤 타입이 와도 상관없다.
}
