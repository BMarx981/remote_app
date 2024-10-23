import 'package:equatable/equatable.dart';

abstract class TVRemoteEvent extends Equatable {
  const TVRemoteEvent();

  @override
  List<Object> get props => [];
}

class TurnOn extends TVRemoteEvent {}

class TurnOff extends TVRemoteEvent {}

class IncreaseVolume extends TVRemoteEvent {}

class DecreaseVolume extends TVRemoteEvent {}

class ChangeChannel extends TVRemoteEvent {
  final int channel;
  const ChangeChannel(this.channel);

  @override
  List<Object> get props => [channel];
}
