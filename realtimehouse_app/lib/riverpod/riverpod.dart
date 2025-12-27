import 'package:realtimehouse_app/main.dart';
import 'package:realtimehouse_app/riverpod/rtk_room_notifier.dart';
import 'package:realtimehouse_app/riverpod/states/room_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RtkListenerManager {
  final WidgetRef ref;

  RtkListenerManager._(this.ref);

  static late RtkListenerManager? _instance;

  static void init(WidgetRef ref) {
    _instance = RtkListenerManager._(ref);
  }

  static RtkListenerManager get instance {
    assert(
      _instance != null,
      'RtkListenerManager not initialized, please call init()',
    );
    return _instance!;
  }

  void registerListener() {
    mobileClient.addMeetingRoomEventListener(
      ref.read(rtkRoomNotifier.notifier),
    );
  }
}

final rtkRoomNotifier = NotifierProvider<RtkRoomNotifier, RtkHouseStates>(
  () => RtkRoomNotifier(),
);
