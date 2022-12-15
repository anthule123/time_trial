import 'package:time_trial/time_trial.dart' as time_trial;

void main(List<String> arguments) {
  final stream =
    Stream<int>.periodic(const Duration(
        seconds: 1), (count) => count * count);
stream.forEach(print); //
}
