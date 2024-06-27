import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/models/states/room_event_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomStateNotifier extends Notifier<RoomEventStates>
    implements DyteMeetingRoomEventsListener {
  @override
  RoomEventStates build() {
    return const RoomEventStates.onMeetingInitStarted();
  }

  @override
  void onMeetingInitCompleted() {
    state = const RoomEventStates.onMeetingInitCompleted();
  }

  @override
  void onMeetingInitFailed(Exception exception) {
    state = RoomEventStates.onMeetingInitFailed(exception);
  }

  @override
  void onMeetingInitStarted() {
    state = const RoomEventStates.onMeetingInitStarted();
  }

  @override
  void onMeetingRoomDisconnected() {
    state = const RoomEventStates.onMeetingRoomDisconnected();
  }

  @override
  void onMeetingRoomJoinCompleted() {
    state = const RoomEventStates.onMeetingRoomJoinCompleted();
  }

  @override
  void onMeetingRoomJoinStarted() {
    state = const RoomEventStates.onMeetingRoomJoinStarted();
  }

  @override
  void onMeetingRoomJoinFailed(Exception exception) {
    state = RoomEventStates.joinFailed(exception);
  }

  @override
  void onMeetingRoomLeaveCompleted() {
    state = const RoomEventStates.onMeetingRoomLeaveCompleted();
  }

  @override
  void onMeetingRoomLeaveStarted() {
    state = const RoomEventStates.onMeetingRoomLeaveStarted();
  }

  @override
  void onActiveTabUpdate(DyteActiveTab? activeTab) {}

  @override
  void onConnectedToMeetingRoom() {}

  @override
  void onConnectingToMeetingRoom() {}

  @override
  void onDisconnectedFromMeetingRoom(String reason) {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingRoomConnectionFailed() {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}
}
