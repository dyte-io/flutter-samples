import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/models/states/local_user_event_states.dart';
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
  void onAudioDevicesUpdated(List<AudioDevice> devices) =>
      state = const LocalUserEventStates.onAudioDevicesUpdated();

  void onProximityChanged(bool isNear) =>
      state = LocalUserEventStates.onProximityChanged(isNear);

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
  void onScreenShareUpdate(bool isEnabled) {}

  @override
  void onVideoDeviceChanged(VideoDevice videoDevice) {}

  @override
  void onAudioDeviceChanged(AudioDevice audioDevice) {}

  @override
  void onPinned() {}

  @override
  void onUnpinned() {}
}
