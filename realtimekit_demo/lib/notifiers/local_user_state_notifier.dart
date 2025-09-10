import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/models/states/local_user_event_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalUserNotifier extends StateNotifier<LocalUserEventStates>
    implements RtkSelfEventListener {
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

  // @override
  // void onProximityChanged(bool isNear) =>
  //     state = LocalUserEventStates.onProximityChanged(isNear);

  @override
  void onWaitListStatusUpdate(WaitlistStatus waitListStatus) =>
      state = LocalUserEventStates.onWaitListStatusUpdate(waitListStatus);

  @override
  void onUpdate(RtkSelfParticipant participant) =>
      state = LocalUserEventStates.onUpdate(participant);

  @override
  void onPermissionsUpdated(SelfPermissions permissions) {}

  @override
  void onRemovedFromMeeting() {}


  @override
  void onScreenShareStartFailed(String reason) {}



  @override
  void onVideoDeviceChanged(VideoDevice videoDevice) {}

  @override
  void onPinned() {
    // TODO: implement onPinned
  }

  @override
  void onScreenShareUpdate(bool isEnabled) {
    // TODO: implement onScreenShareUpdate
  }

  @override
  void onUnpinned() {
    // TODO: implement onUnpinned
  }
}
