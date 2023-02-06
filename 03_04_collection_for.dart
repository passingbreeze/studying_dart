void main(List<String> args) {
  var oldFriends = ['a', 'b', 'c'];
  var newFriends = [
    'd',
    'e',
    'f',
    for (var friend in oldFriends) "$friend",
  ];
  print(newFriends);
}
