void main(List<String> args) {
  String name = 'jeongmin';
  // name = null; <- this causes errors
  String? lastname = 'hong';
  lastname = null;

  if (lastname != null) {
    // 1
    lastname.isNotEmpty;
  }
  lastname?.isNotEmpty; // 2
  // 1와 2는 같은 코드
}
/**
 * null safety = not reference null variable
 */