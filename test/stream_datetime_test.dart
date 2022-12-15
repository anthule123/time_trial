import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:test/test.dart';

void main() async {
  StreamController controller = StreamController();
  setUp(() {
    controller = StreamController.broadcast(sync: false);
  });

  tearDown(() {
    controller.close();
  });

  test('Stream listen test', () {
    var stream = controller.stream;

    final String value = 'Here is an event!';

    stream.listen((event) {
      print(event);
      // >>>>> How can I test if this was called?? <<<<<<
    });

    expectLater(stream, emits(value));

    controller.add(value);
  });
  final stream = Stream<int>.periodic(
      const Duration(seconds: 1), (count) => count * count);

  test('Stream periodic listen test', () async {
    stream.listen((event) {
      print(event);
    }); //
    //  print(stream.length);
    // expectLater(stream, emits(matcher));
  });
  test('stackoverflow sol', () {
    final Stream newsStream =
        new Stream.periodic(Duration(seconds: 2), (x) => x);

    newsStream
        .map((e) {
          print('hello');
          return 'stuff $e';
        })
        .take(5)
        .forEach((e) {
          print(e);
        });
  });
  test("After 10 seconds emits true", () {
    final Stream newsStream =
        new Stream.periodic(Duration(seconds: 1), (x) => x);

    FakeAsync().run((async) {
      newsStream.listen((event) {
        print(event);
      });

      async.elapse(Duration(seconds: 10));
      //    expect(streamOutput, /* expected value */);
    });
  });
}
