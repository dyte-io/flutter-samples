import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtimekit_core/realtimekit_core.dart';

part 'local_user_event_states.freezed.dart';

@freezed
class LocalUserEventStates with _$LocalUserEventStates {
  const factory LocalUserEventStates.initial() = _LocalUserEventStateInitial;

  const factory LocalUserEventStates.onMeetingRoomJoinedWithoutCameraPermission() =
      _LocalUserEventStateonMeetingRoomJoinedWithoutCameraPermission;

  const factory LocalUserEventStates.onMeetingRoomJoinedWithoutMicPermission() =
      _LocalUserEventStateonMeetingRoomJoinedWithoutMicPermission;

  const factory LocalUserEventStates.onAudioUpdate(bool audioEnabled) =
      _LocalUserEventStateonAudioUpdate;

  const factory LocalUserEventStates.onVideoUpdate(bool videoEnabled) =
      _LocalUserEventStateonVideoUpdate;

  const factory LocalUserEventStates.onAudioDevicesUpdated() =
      _LocalUserEventStateOnAudioDevicesUpdated;

  const factory LocalUserEventStates.onProximityChanged(bool isNear) =
      _LocalUserEventStateonProximityChanged;

  const factory LocalUserEventStates.onWaitListStatusUpdate(
      WaitlistStatus status) = _LocalUserEventStateonWaitListStatusUpdate;

  const factory LocalUserEventStates.onUpdate(RtkSelfParticipant participant) =
      _LocalUserEventStateonUpdate;

  const factory LocalUserEventStates.onWebinarPresentRequestReceived() =
      _LocalUserEventStateonWebinarPresentRequestReceived;

  const factory LocalUserEventStates.onStoppedPresenting() =
      _LocalUserEventStateonStoppedPresenting;

  const factory LocalUserEventStates.onMeetingRoomLeft() =
      _LocalUserEventStatesOnMeetingRoomLeaveLeft;

  const factory LocalUserEventStates.onMeetingRoomDisconnected() =
      _LocalUserEventStateonMeetingRoomDisconnected;
}
