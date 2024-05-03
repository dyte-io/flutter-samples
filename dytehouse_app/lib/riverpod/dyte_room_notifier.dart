import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:dytehouse/riverpod/states/room_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DyteRoomNotifier extends Notifier<DyteHouseStates>
    with DyteMeetingRoomEventsListener {
  DyteRoomNotifier();

  @override
  DyteHouseStates build() {
    return DyteHouseInitial();
  }

  @override
  void onMeetingInitStarted() {
    state = DyteHouseInitStarted();
  }

  @override
  void onMeetingInitCompleted() {
    state = DyteHouseInitCompleted();
  }

  @override
  void onMeetingInitFailed(Exception exception) {
    state = DyteHouseInitFailed(exception);
  }

  @override
  void onMeetingRoomJoinCompleted() {
    state = DyteHouseRoomJoinCompleted();
  }

  @override
  void onMeetingRoomJoinFailed(Exception exception) {
    state = DyteHouseRoomJoinFailed(exception);
  }

  @override
  void onMeetingRoomJoinStarted() {
    state = DyteHouseRoomJoinStarted();
  }

  @override
  void onMeetingRoomLeaveCompleted() {
    state = DyteHouseRoomLeaveCompleted();
  }
}
