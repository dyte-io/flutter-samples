import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/notifiers/settings_repository.dart';
import 'package:flutter_core/notifiers/states/local_user_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalUserNotifer extends Notifier<LocalUserState>
    implements DyteSelfEventsListener {
  LocalUserNotifer(this._settingsRepository) : super();

  @override
  LocalUserState build() {
    return const LocalUserState.initial();
  }

  final LocalUserSettingsRepository _settingsRepository;

  bool get isVideoEnabled => _settingsRepository.isVideoEnabled;

  set isVideoEnabled(bool value) => _settingsRepository.isVideoEnabled = value;

  set isAudioEnabled(bool value) => _settingsRepository.isAudioEnabled = value;

  bool get isAudioEnabled => _settingsRepository.isAudioEnabled;

  Future<void> toggleAudio() async {
    final isAudioEnabled = _settingsRepository.toggleAudio();
    onAudioUpdate(isAudioEnabled);
  }

  Future<void> toggleVideo() async {
    final isVideoEnabled = _settingsRepository.toggleVideo();
    onVideoUpdate(isVideoEnabled);
  }

  @override
  void onAudioDevicesUpdated() =>
      state = const LocalUserState.onAudioDevicesUpdated();

  @override
  void onProximityChanged(bool isNear) =>
      state = LocalUserState.onProximityChanged(isNear);

  @override
  void onUpdate(DyteSelfUser participant) =>
      state = LocalUserState.onUpdate(participant);

  @override
  void onVideoUpdate(bool videoEnabled) =>
      state = LocalUserState.onVideoUpdate(videoEnabled);

  @override
  void onAudioUpdate(bool audioEnabled) =>
      state = LocalUserState.onAudioUpdate(audioEnabled);

  @override
  void onMeetingRoomJoinedWithoutCameraPermission() {
    state = const LocalUserState.onMeetingRoomJoinedWithoutCameraPermission();
  }

  @override
  void onMeetingRoomJoinedWithoutMicPermission() {
    state = const LocalUserState.onMeetingRoomJoinedWithoutMicPermission();
  }

  @override
  void onRemovedFromMeeting() {
    state = const LocalUserState.onRemovedFromMeeting();
  }

  @override
  void onWaitListStatusUpdate(DyteWaitListStatus waitListStatus) {
    state = LocalUserState.onWaitListStatusUpdate(waitListStatus);
  }

  @override
  void onPermissionsUpdated(DytePermissions permissions) {}

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
