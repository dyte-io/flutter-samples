import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/notifiers/states/router_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouterNotifier extends Notifier<RouterStates>
    implements DyteMeetingRoomEventsListener, DyteSelfEventsListener {
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
  void onMeetingRoomDisconnected() {
    state = OnRouterMeetingRoomDisconnected();
  }

  @override
  void onWaitListStatusUpdate(DyteWaitListStatus waitListStatus) {
    state = OnRouterSelfWaitingRoomStatusUpdate(waitListStatus);
  }

  @override
  void onActiveTabUpdate(DyteActiveTab? activeTab) {}

  @override
  void onAudioDevicesUpdated() {}

  @override
  void onAudioUpdate(bool audioEnabled) {}

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
  void onMeetingRoomJoinedWithoutCameraPermission() {}

  @override
  void onMeetingRoomJoinedWithoutMicPermission() {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onPermissionsUpdated(DytePermissions permissions) {}

  @override
  void onProximityChanged(bool isNear) {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}

  @override
  void onRemovedFromMeeting() {}

  @override
  void onRoomMessage(String type, Map<String, dynamic> payload) {}

  @override
  void onScreenShareStartFailed(String reason) {}

  @override
  void onScreenShareStarted() {}

  @override
  void onScreenShareStopped() {}

  @override
  void onStageStatusUpdated(DyteStageStatus stageStatus) {}

  @override
  void onUpdate(DyteSelfUser participant) {}

  @override
  void onVideoDeviceChanged(DyteVideoDevice videoDevice) {}

  @override
  void onVideoUpdate(bool videoEnabled) {}
}
