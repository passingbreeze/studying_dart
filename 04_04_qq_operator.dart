String capitalizeName(String? name) =>
    name?.toUpperCase() ??
    'NaN'; // == name != null ? name.toUpperCase() : 'NaN';
void main(List<String> args) {
  capitalizeName('jeongmin');
  capitalizeName(null);

  String? name;
  name ??= 'Jeongmin'; // name == null -> input 'Jeongmin'
  print(name);
  name = null;
  name ??= 'another';
  print(name);
}
