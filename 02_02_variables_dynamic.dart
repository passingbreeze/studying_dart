void main(List<String> args) {
  dynamic whatever; // not recommended for general usage.
  whatever = 'jeongmin';
  whatever = 12;
  whatever = true;

  if (whatever is bool) {
    // execution statements when whatever is boolean type
  } else if (whatever is int) {
    // statements when whatever is int type
  }
}
