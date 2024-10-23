import 'package:equatable/equatable.dart';

class TVRemoteState extends Equatable {
  final bool isOn;
  final int volume;
  final int channel;

  const TVRemoteState({
    required this.isOn,
    required this.volume,
    required this.channel,
  });

  TVRemoteState copyWith({
    bool? isOn,
    int? volume,
    int? channel,
  }) {
    return TVRemoteState(
      isOn: isOn ?? this.isOn,
      volume: volume ?? this.volume,
      channel: channel ?? this.channel,
    );
  }

  @override
  List<Object> get props => [isOn, volume, channel];
}
