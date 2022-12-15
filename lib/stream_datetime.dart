secondStream() async {
  return Stream.periodic(Duration(seconds: 1), (x) => x);
}
