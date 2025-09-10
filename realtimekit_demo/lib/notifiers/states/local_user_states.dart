import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_user_states.freezed.dart';

@freezed
class LocalUserState with _$LocalUserState {
  const factory LocalUserState.initial() = _LocalUserInitialState;
  const factory LocalUserState.onVideoUpdate(bool isVideoEnabled) =
      _LocalUserVideoState;
  const factory LocalUserState.onAudioUpdate(bool isAudioEnabled) =
      _LocalUserAudioState;

  const factory LocalUserState.onMeetingRoomJoinedWithoutCameraPermission() =
      _LocalUserOnMeetingRoomJoinedWithoutCameraPermission;

  const factory LocalUserState.onMeetingRoomJoinedWithoutMicPermission() =
      _LocalUserOnMeetingRoomJoinedWithoutMicPermission;

  const factory LocalUserState.onRemovedFromMeeting() =
      _LocalUserOnRemovedFromMeeting;

  const factory LocalUserState.onAudioDevicesUpdated() =
      _LocalUserOnAudioDevicesUpdated;

  const factory LocalUserState.onProximityChanged(bool isNear) =
      _LocalUserOnProximityChanged;

  const factory LocalUserState.onUpdate(RtkSelfParticipant participant) =
      _LocalUserOnUpdate;

  const factory LocalUserState.onStoppedPresenting() =
      _LocalUserOnStoppedPresenting;

  const factory LocalUserState.onWaitListStatusUpdate(
      WaitlistStatus waitListStatus) = _LocalUserOnWaitListStatusUpdate;

  const factory LocalUserState.onWebinarPresentRequestReceived() =
      _LocalUserOnWebinarPresentRequestReceived;
}
