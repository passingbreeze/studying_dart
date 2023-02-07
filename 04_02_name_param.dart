String sayHello({
  required String
      name, // if you use named parameter on dart function. Null caution!
  required int age, // required keyword warn you when you don't input argument
  String country = 'South Korea', // default parameter
}) =>
    "Hello $name! You seem to be a $age years old guy from $country, don't you?";
void main(List<String> args) {
  print(sayHello(
    age: 30,
    country: 'South Korea',
    name: 'Hong Jeongmin',
  ));
}
