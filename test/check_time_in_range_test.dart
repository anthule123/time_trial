import 'package:async/async.dart';
import 'package:test/test.dart';
import 'package:time_trial/check_time_in_range.dart';
import 'package:time_trial/sonde_range.dart';

void main() {
  group('group name', () {
    test('Hour Minute', () {
      DateTime a = DateTime(2022, 12, 13, 6, 35);
      HourMinute h = HourMinute(6, 35);
      print(h);
    });
    test('in time range', () {
      Range r = Range(
        simple('5:30'),
        simple('6:30'),
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
          HourMinute(root[i] - 1, 30),
          HourMinute(root[i], 30),
        );
        listRange.add(a);
      }
      print(listRange);
      test('a time in 4 range', () {
        DateTime a = DateTime.now(); //18 :13
        dynamic b = [for (int i = 0; i < 4; i++) inRange(a, listRange[i])];
        var result = b.any((element) => element == true);
        print(result);
      });
      test('5:00 in 4 range', () {
        DateTime a = DateTime(2000, 1, 1, 5, 0); //18 :13
        dynamic b = [for (int i = 0; i < 4; i++) inRange(a, listRange[i])];
        var result = b.any((element) => element == true);
        print(result);
      });
    });
    test('test name', () {
      List<bool> data = [true, false, true];

      data.replaceRange(0, data.length, data.map((element) => false));

      print(data);
    });
    test('test name2', () {
      dynamic b = [true, false, false, false];
      var result = b.any((element) => element == true);
      print(result);
    });
    test('4:00 in sonde range', () {
      expect(inSondeRange(DateTime(1, 1, 1, 4)), false);
    });
  });
}
