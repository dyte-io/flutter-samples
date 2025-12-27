import 'package:realtimekit_ui/realtimekit_ui.dart';
import 'package:realtimehouse_app/main.dart';
import 'package:realtimehouse_app/riverpod/states/room_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RtkRoomNotifier extends Notifier<RtkHouseStates>
    implements RtkMeetingRoomEventListener {
  RtkRoomNotifier();

  @override
  RtkHouseStates build() {
    return RtkHouseInitial();
  }

  @override
  void onMeetingInitStarted() {
    state = RtkHouseInitStarted();
  }

  @override
  void onMeetingInitCompleted() {
    state = RtkHouseInitCompleted();
  }

  @override
  void onMeetingInitFailed(MeetingError error) {
    state = RtkHouseInitFailed(error);
  }

  @override
  void onMeetingRoomJoinCompleted() {
    state = RtkHouseRoomJoinCompleted();
  }

  @override
  void onMeetingRoomJoinFailed(MeetingError error) {
    state = RtkHouseRoomJoinFailed(error);
  }

  @override
  void onMeetingRoomJoinStarted() {
    state = RtkHouseRoomJoinStarted();
  }

  @override
  void onMeetingRoomLeaveCompleted() {
    state = RtkHouseRoomLeaveCompleted();
    mobileClient.removeMeetingRoomEventListener(this);
  }

  @override
  void onActiveTabUpdate(ActiveTab? activeTab) {}

  @override
  void onMeetingEnded() {
    state = RtkHouseRoomLeaveCompleted(release: true);
  }

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onSocketConnectionUpdate(SocketConnectionState connectionState) {}
}
