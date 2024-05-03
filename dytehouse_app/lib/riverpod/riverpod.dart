import 'package:dytehouse/main.dart';
import 'package:dytehouse/riverpod/dyte_room_notifier.dart';
import 'package:dytehouse/riverpod/states/room_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DyteListenerManager {
  final WidgetRef ref;

  DyteListenerManager._(this.ref);

  static late DyteListenerManager? _instance;

  static void init(WidgetRef ref) {
    _instance = DyteListenerManager._(ref);
  }

  static DyteListenerManager get instance {
    assert(_instance != null,
        'ManageListener not initialized, please call init()');
    return _instance!;
  }

  void registerListener() {
    mobileClient
        .addMeetingRoomEventsListener(ref.read(dyteRoomNotifier.notifier));
  }
}

final dyteRoomNotifier = NotifierProvider<DyteRoomNotifier, DyteHouseStates>(
  () => DyteRoomNotifier(),
);
