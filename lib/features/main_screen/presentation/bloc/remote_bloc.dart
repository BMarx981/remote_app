import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'remote_events.dart';
import 'remote_state.dart';

class TVRemoteBloc extends Bloc<TVRemoteEvent, TVRemoteState> {
  static const platform = MethodChannel('connectsdk/flutter');

  TVRemoteBloc()
      : super(const TVRemoteState(isOn: false, volume: 10, channel: 1)) {
    on<TurnOn>((event, emit) async {
      await platform.invokeMethod('turnOn');
      emit(state.copyWith(isOn: true));
    });

    on<TurnOff>((event, emit) async {
      await platform.invokeMethod('turnOff');
      emit(state.copyWith(isOn: false));
    });

    on<IncreaseVolume>((event, emit) async {
      await platform.invokeMethod('increaseVolume');
      emit(state.copyWith(volume: state.volume + 1));
    });

    on<DecreaseVolume>((event, emit) async {
      await platform.invokeMethod('decreaseVolume');
      emit(state.copyWith(volume: state.volume - 1));
    });

    on<ChangeChannel>((event, emit) async {
      await platform.invokeMethod('changeChannel', {"channel": event.channel});
      emit(state.copyWith(channel: event.channel));
    });
  }
}
