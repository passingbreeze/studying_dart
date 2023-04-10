typedef intList = List<int>;

intList reversedList(intList nums) => nums.reversed.toList();
void main(List<String> args) {
  print(reversedList([1, 2, 3, 4, 5]));
}
