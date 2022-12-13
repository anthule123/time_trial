import 'package:test/test.dart';
import 'package:time_trial/stream_time.dart';

void main() async {
  TheBloc theBloc = TheBloc();
  
  test('test name', () async {
    print(theBloc.state.dateTime);
  Future.delayed(Duration(seconds: 2));
  print(theBloc.state.dateTime);
  });
  
}
