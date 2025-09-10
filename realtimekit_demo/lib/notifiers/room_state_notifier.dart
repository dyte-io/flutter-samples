import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/models/states/room_event_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomStateNotifier extends Notifier<RoomEventStates>
    implements RtkMeetingRoomEventListener {
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
  void onActiveTabUpdate(ActiveTab? activeTab) {}



  @override
  void onMeetingEnded() {}



  @override
  void onSocketConnectionUpdate(SocketConnectionState state) {

  }
}
