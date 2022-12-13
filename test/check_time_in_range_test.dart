import 'package:async/async.dart';
import 'package:test/test.dart';
import 'package:time_trial/check_time_in_range.dart';

void main() {
  group('group name', () {
    test('Hour Minute', () {
      DateTime a = DateTime(2022, 12, 13, 6, 35);
      HourMinute h = HourMinute(6, 35);
      print(h);
    });
    test('in time range', () {
      Range r = Range(
        start: simple('5:30'),
        end: simple('6:30'),
      );
      DateTime a = DateTime(2022, 12, 13, 6, 35);
      print(inRange(a, r));
    });
    test('split string', () {
      String a = '6:30';
      dynamic b = a.split(':');
      print(b);
    });
    group('4 range', () {
      List<Range> listRange = [];
      List<int> root = [6, 12, 18, 22];

      for (int i = 0; i < 4; i++) {
        Range a = Range(
          start: HourMinute(root[i] - 1, 30),
          end: HourMinute(root[i], 30),
        );
        listRange.add(a);
      }
      print(listRange);
      test('a time in 4 range', () {
        DateTime a = DateTime.now();
        bool ans = true;
      });
    });
    test('test name', () {
      List<bool> data = [true, false, true];

      data.replaceRange(0, data.length, data.map((element) => false));

      print(data);
    });
    test('test name2', () {
      dynamic b = [true,false,false, false];
      var result = b.any((element) => element == true);
      print(result);
    });
  });
}
