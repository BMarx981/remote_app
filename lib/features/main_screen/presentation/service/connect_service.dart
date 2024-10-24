import 'package:flutter/services.dart';

class ConnectSDKService {
  static const _platform = MethodChannel('com.example.connectsdk');

  Future<List<String>> searchForTVs() async {
    try {
      final List<dynamic> tvs = await _platform.invokeMethod('searchForTVs');
      return tvs.cast<String>();
    } on PlatformException catch (e) {
      throw 'Failed to search for TVs: ${e.message}';
    }
  }

  Future<void> connectToTV(String tvId) async {
    try {
      await _platform.invokeMethod('connectToTv', {'tvId': tvId});
    } on PlatformException catch (e) {
      throw 'Failed to connect to TV: ${e.message}';
    }
  }

  Future<void> changeChannel(int channel) async {
    try {
      await _platform.invokeMethod('changeChannel', {'changeChannel': channel});
    } on PlatformException catch (e) {
      throw 'Failed to change the channel: ${e.message}';
    }
  }

  Future<void> adjustVolume(int volumeLevel) async {
    try {
      await _platform
          .invokeMethod('adjustVolume', {'adjustVolume': volumeLevel});
    } on PlatformException catch (e) {
      throw 'Failed to change volume: ${e.message}';
    }
  }

  Future<void> navigate(String direction) async {
    try {
      await _platform.invokeMethod('navigate', {'direction', direction});
    } on PlatformException catch (e) {
      throw 'Failed to navigate: ${e.message}';
    }
  }

  Future<void> hitEnter() async {
    await _platform.invokeMethod('hitEnter');
  }
}
