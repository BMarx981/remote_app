import 'package:bloc_test/bloc_test.dart';
import 'package:remote_app/features/main_screen/presentation/bloc/remote_bloc.dart';
import 'package:remote_app/features/main_screen/presentation/bloc/remote_events.dart';
import 'package:remote_app/features/main_screen/presentation/bloc/remote_state.dart';

void main() {
  blocTest<TVRemoteBloc, TVRemoteState>(
    'emits [isOn: true] when TurnOn is added',
    build: () => TVRemoteBloc(),
    act: (bloc) => bloc.add(TurnOn()),
    expect: () => [const TVRemoteState(isOn: true, volume: 10, channel: 1)],
  );

  // Add similar tests for other events like TurnOff, IncreaseVolume, etc.
}
