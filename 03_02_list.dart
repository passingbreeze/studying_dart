void main(List<String> args) {
  // 매우 자주 사용되는 리스트!
  var giveMeFive = true;
  List<int> numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5, // 1
  ];
  if (giveMeFive) {
    // 2
    numbers.add(5);
  } // 1과 2는 같은 의미
}
