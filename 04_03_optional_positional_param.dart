String sayHello(String name, int age,
        [String? country = 'South Korea'] // optional positional parameter
        ) =>
    "Hello $name! You seem to be a $age years old guy from $country, don't you?";

void main(List<String> args) {
  print(sayHello('Jeongmin', 30));
}
