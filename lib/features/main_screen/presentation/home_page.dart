import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/remote_bloc.dart';
import 'bloc/remote_events.dart';
import 'bloc/remote_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TV Remote')),
      body: BlocProvider(
        create: (context) => TVRemoteBloc(),
        child: BlocBuilder<TVRemoteBloc, TVRemoteState>(
          builder: (context, state) {
            return Column(
              children: [
                Text('TV is ${state.isOn ? "On" : "Off"}'),
                Text('Volume: ${state.volume}'),
                Text('Channel: ${state.channel}'),
                ElevatedButton(
                  onPressed: () => context.read<TVRemoteBloc>().add(TurnOn()),
                  child: const Text('Turn On'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<TVRemoteBloc>().add(TurnOff()),
                  child: const Text('Turn Off'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<TVRemoteBloc>().add(IncreaseVolume()),
                  child: const Text('Increase Volume'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<TVRemoteBloc>().add(DecreaseVolume()),
                  child: const Text('Decrease Volume'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<TVRemoteBloc>().add(const ChangeChannel(5)),
                  child: const Text('Change to Channel 5'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
