import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:dytehouse/main.dart';
import 'package:dytehouse/riverpod/states/room_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DyteRoomNotifier extends Notifier<DyteHouseStates>
    implements DyteMeetingRoomEventsListener {
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
    mobileClient.removeMeetingRoomEventsListener(this);
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
  void onMeetingEnded() {
    state = DyteHouseRoomLeaveCompleted(release: true);
  }

  @override
  void onMeetingRoomConnectionFailed() {}

  @override
  void onMeetingRoomDisconnected() {}

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}
}
