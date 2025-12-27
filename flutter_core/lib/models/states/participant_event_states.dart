import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_event_states.freezed.dart';

@freezed
class ParticipantEventStates with _$ParticipantEventStates {
  const factory ParticipantEventStates.initial() = _ParticipantEventStates;

  const factory ParticipantEventStates.onParticipantJoin(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnParticipantJoin;

  const factory ParticipantEventStates.onParticipantLeave(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnParticipantLeave;

  const factory ParticipantEventStates.onScreenSharesUpdated() =
      _ParticipantEventStatesOnScreenSharesUpdated;

  const factory ParticipantEventStates.onScreenShareStarted(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnScreenShareStarted;

  const factory ParticipantEventStates.onScreenShareEnded(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnScreenShareEnded;

  const factory ParticipantEventStates.onAudioUpdate({
    required bool audioEnabled,
    required RtkRemoteParticipant participant,
  }) = _ParticipantEventStatesAudioUpdate;

  const factory ParticipantEventStates.onVideoUpdate(
          {required bool videoEnabled,
          required RtkRemoteParticipant participant}) =
      _ParticipantEventStatesVideoUpdate;

  const factory ParticipantEventStates.onActiveSpeakerChanged(
          RtkRemoteParticipant participant) =
      _ParticipantEventStateOnActiveSpeakerChanged;

  const factory ParticipantEventStates.onNoActiveSpeaker() =
      _ParticipantEventStatesOnNoActiveSpeaker;

  const factory ParticipantEventStates.onParticipantPinned(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnParticipantPinned;

  const factory ParticipantEventStates.onParticipantUnpinned() =
      _ParticipantEventStatesOnParticipantUnpinned;

  const factory ParticipantEventStates.onUpdate(RtkParticipants participants) =
      _ParticipantEventStatesOnUpdate;

  const factory ParticipantEventStates.onActiveParticipantsChanged(
          {required List<RtkRemoteParticipant> activeParticipants}) =
      _OnActiveParticipantsChanged;

  const factory ParticipantEventStates.onWaitListParticipantAccepted(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnWaitListParticipantAccepted;

  const factory ParticipantEventStates.onWaitListParticipantClosed(
          RtkRemoteParticipant participant) =
      _ParticipantEventStateOnWaitListParticipantClosed;

  const factory ParticipantEventStates.onWaitListParticipantJoined(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnWaitListParticipantJoined;

  const factory ParticipantEventStates.onWaitListParticipantRejected(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnWaitListParticipantRejected;
}
