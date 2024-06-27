import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/models/states/local_user_event_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalUserNotifier extends StateNotifier<LocalUserEventStates>
    implements DyteSelfEventsListener {
  LocalUserNotifier() : super(const LocalUserEventStates.initial());

  @override
  void onMeetingRoomJoinedWithoutCameraPermission() => state =
      const LocalUserEventStates.onMeetingRoomJoinedWithoutCameraPermission();

  @override
  void onMeetingRoomJoinedWithoutMicPermission() => state =
      const LocalUserEventStates.onMeetingRoomJoinedWithoutMicPermission();

  @override
  void onAudioUpdate(bool audioEnabled) =>
      state = LocalUserEventStates.onAudioUpdate(audioEnabled);

  @override
  void onVideoUpdate(bool videoEnabled) =>
      state = LocalUserEventStates.onVideoUpdate(videoEnabled);

  @override
  void onAudioDevicesUpdated() =>
      state = const LocalUserEventStates.onAudioDevicesUpdated();

  @override
  void onProximityChanged(bool isNear) =>
      state = LocalUserEventStates.onProximityChanged(isNear);

  @override
  void onWaitListStatusUpdate(DyteWaitListStatus waitListStatus) =>
      state = LocalUserEventStates.onWaitListStatusUpdate(waitListStatus);

  @override
  void onUpdate(DyteSelfUser participant) =>
      state = LocalUserEventStates.onUpdate(participant);

  @override
  void onPermissionsUpdated(DytePermissions permissions) {}

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
  void onVideoDeviceChanged(DyteVideoDevice videoDevice) {}
}
