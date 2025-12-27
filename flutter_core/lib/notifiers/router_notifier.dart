import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/notifiers/states/router_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouterNotifier extends Notifier<RouterStates>
    implements RtkMeetingRoomEventListener, RtkSelfEventListener {
  @override
  RouterStates build() {
    return RouterInitial();
  }

  @override
  void onMeetingInitStarted() {
    state = OnRouterMeetingInitStarted();
  }

  @override
  void onMeetingInitCompleted() {
    state = OnRouterMeetingInitCompleted();
  }

  @override
  void onMeetingInitFailed(MeetingError error) {
    state = OnRouterMeetingInitFailed(Exception(error.message));
  }

  @override
  void onMeetingRoomJoinStarted() {
    state = OnRouterMeetingRoomJoinStarted();
  }

  @override
  void onMeetingRoomJoinCompleted() {
    state = OnRouterMeetingRoomJoinCompleted();
  }

  @override
  void onMeetingRoomJoinFailed(MeetingError error) {
    state = OnRouterMeetingRoomJoinFailed(Exception(error.message));
  }

  @override
  void onMeetingRoomLeaveStarted() {
    state = OnRouterMeetingRoomLeaveStarted();
  }

  @override
  void onMeetingRoomLeaveCompleted() {
    state = OnRouterMeetingRoomLeaveCompleted();
  }

  void onMeetingRoomDisconnected() {
    state = OnRouterMeetingRoomDisconnected();
  }

  @override
  void onWaitListStatusUpdate(WaitlistStatus waitListStatus) {
    state = OnRouterSelfWaitingRoomStatusUpdate(waitListStatus);
  }

  @override
  void onAudioDevicesUpdated(List<AudioDevice> devices) {}

  @override
  void onAudioUpdate(bool audioEnabled) {}

  void onConnectedToMeetingRoom() {}

  void onConnectingToMeetingRoom() {}

  void onDisconnectedFromMeetingRoom(String reason) {}

  @override
  void onMeetingEnded() {}

  void onMeetingRoomConnectionFailed() {}

  @override
  void onMeetingRoomJoinedWithoutCameraPermission() {}

  @override
  void onMeetingRoomJoinedWithoutMicPermission() {}

  void onMeetingRoomReconnectionFailed() {}

  @override
  void onPermissionsUpdated(SelfPermissions permissions) {}

  void onProximityChanged(bool isNear) {}

  void onReconnectedToMeetingRoom() {}

  void onReconnectingToMeetingRoom() {}

  @override
  void onRemovedFromMeeting() {}

  @override
  void onScreenShareStartFailed(String reason) {}

  @override
  void onScreenShareUpdate(bool isEnabled) {}

  @override
  void onUpdate(RtkSelfParticipant participant) {}

  @override
  void onVideoDeviceChanged(VideoDevice videoDevice) {}

  @override
  void onVideoUpdate(bool videoEnabled) {}

  @override
  void onAudioDeviceChanged(AudioDevice audioDevice) {}

  @override
  void onPinned() {}

  @override
  void onUnpinned() {}

  @override
  void onSocketConnectionUpdate(SocketConnectionState connectionState) {}

  @override
  void onActiveTabUpdate(ActiveTab? activeTab) {}
}
