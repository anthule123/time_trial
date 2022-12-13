import 'dart:async';

import 'package:bloc/bloc.dart';

Stream<DateTime> currentTime() =>
    Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());

class TheBloc extends Bloc<TheEvent, TheState> {
  TheBloc() : super(TheState(dateTime: DateTime.now())) {
    _currentTimeSubscription = currentTime().listen(_onCurrentTimeTicked);
  }
  late final StreamSubscription _currentTimeSubscription;

  void _onCurrentTimeTicked(DateTime dateTime) =>
      add(CurrentTimeTicked(dateTime));

  @override
  Future<void> close() {
    _currentTimeSubscription.cancel();
    return super.close();
  }

  @override
  Stream<TheState> mapEventToState(
    TheEvent event,
  ) async* {
    if (event is CurrentTimeTicked) {
      yield TheState(dateTime: event.dateTime);
    }
  }
}

abstract class TheEvent {}

class CurrentTimeTicked extends TheEvent {
  CurrentTimeTicked(this.dateTime);

  final DateTime dateTime;
}

class TheState {
  TheState({required this.dateTime});

  final DateTime dateTime;
}
