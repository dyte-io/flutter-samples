import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/notifiers/states/router_states.dart';
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
  void onMeetingInitFailed(Exception exception) {
    print(exception.toString());
    state = OnRouterMeetingInitFailed(exception);
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
  void onMeetingRoomJoinFailed(Exception exception) {
    print(exception.toString());
    state = OnRouterMeetingRoomJoinFailed(exception);
  }

  @override
  void onMeetingRoomLeaveStarted() {
    state = OnRouterMeetingRoomLeaveStarted();
  }

  @override
  void onMeetingRoomLeaveCompleted() {
    state = OnRouterMeetingRoomLeaveCompleted();
  }


  @override
  void onWaitListStatusUpdate(WaitlistStatus waitListStatus) {
    state = OnRouterSelfWaitingRoomStatusUpdate(waitListStatus);
  }

  @override
  void onActiveTabUpdate(ActiveTab? activeTab) {}

  @override
  void onAudioDevicesUpdated() {}

  @override
  void onAudioUpdate(bool audioEnabled) {}



  @override
  void onMeetingEnded() {
    state = OnRouterMeetingRoomDisconnected();

  }


  @override
  void onMeetingRoomJoinedWithoutCameraPermission() {}

  @override
  void onMeetingRoomJoinedWithoutMicPermission() {}


  @override
  void onPermissionsUpdated(SelfPermissions permissions) {}



  @override
  void onRemovedFromMeeting() {}



  @override
  void onScreenShareStartFailed(String reason) {}


  @override
  void onUpdate(RtkSelfParticipant participant) {}

  @override
  void onVideoDeviceChanged(VideoDevice videoDevice) {}

  @override
  void onVideoUpdate(bool videoEnabled) {}

  @override
  void onPinned() {
    // TODO: implement onPinned
  }

  @override
  void onScreenShareUpdate(bool isEnabled) {
    // TODO: implement onScreenShareUpdate
  }

  @override
  void onSocketConnectionUpdate(SocketConnectionState state ) {
    // TODO: implement onSocketConnectionUpdate
  }

  @override
  void onUnpinned() {
    // TODO: implement onUnpinned
  }
}
