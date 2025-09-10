import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtimekit_core/realtimekit_core.dart';

part 'participant_event_states.freezed.dart';

@freezed
class ParticipantEventStates with _$ParticipantEventStates {
  const factory ParticipantEventStates.initial() = _ParticipantEventStates;

  const factory ParticipantEventStates.onParticipantJoin(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnParticipantJoin;

  const factory ParticipantEventStates.onParticipantLeave(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnParticipantLeave;

  const factory ParticipantEventStates.onScreenSharesUpdated() =
      _ParticipantEventStatesOnScreenSharesUpdated;

  const factory ParticipantEventStates.onScreenShareStarted(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnScreenShareStarted;

  const factory ParticipantEventStates.onScreenShareEnded(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnScreenShareEnded;

  const factory ParticipantEventStates.onAudioUpdate({
    required bool audioEnabled,
    required RtkMeetingParticipant participant,
  }) = _ParticipantEventStatesAudioUpdate;

  const factory ParticipantEventStates.onVideoUpdate(
          {required bool videoEnabled,
          required RtkMeetingParticipant participant}) =
      _ParticipantEventStatesVideoUpdate;

  const factory ParticipantEventStates.onActiveSpeakerChanged(
      RtkRemoteParticipant? participant) =
      _ParticipantEventStateOnActiveSpeakerChanged;

  const factory ParticipantEventStates.onNoActiveSpeaker() =
      _ParticipantEventStatesOnNoActiveSpeaker;

  const factory ParticipantEventStates.onParticipantPinned(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnParticipantPinned;

  const factory ParticipantEventStates.onParticipantUnpinned() =
      _ParticipantEventStatesOnParticipantUnpinned;

  const factory ParticipantEventStates.onUpdate(RtkParticipants participants) =
      _ParticipantEventStatesOnUpdate;

  const factory ParticipantEventStates.onActiveParticipantsChanged(
          {required List<RtkMeetingParticipant> activeParticipants}) =
      _OnActiveParticipantsChanged;

  const factory ParticipantEventStates.onWaitListParticipantAccepted(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnWaitListParticipantAccepted;

  const factory ParticipantEventStates.onWaitListParticipantClosed(
      RtkMeetingParticipant participant) =
      _ParticipantEventStateOnWaitListParticipantClosed;

  const factory ParticipantEventStates.onWaitListParticipantJoined(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnWaitListParticipantJoined;

  const factory ParticipantEventStates.onWaitListParticipantRejected(
      RtkMeetingParticipant participant) =
      _ParticipantEventStatesOnWaitListParticipantRejected;
}
