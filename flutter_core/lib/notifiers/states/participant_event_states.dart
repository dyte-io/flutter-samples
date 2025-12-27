import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_event_states.freezed.dart';

@freezed
class ParticipantEventStates with _$ParticipantEventStates {
  const factory ParticipantEventStates.initial() = _ParticipantEventStates;

  const factory ParticipantEventStates.onAudioUpdate({
    required bool audioEnabled,
    required RtkRemoteParticipant participant,
  }) = _ParticipantEventStatesAudioUpdate;

  const factory ParticipantEventStates.onActiveSpeakerChanged(
          RtkRemoteParticipant participant) =
      _ParticipantEventStateOnActiveSpeakerChanged;

  const factory ParticipantEventStates.onNoActiveSpeaker() =
      _ParticipantEventStatesOnNoActiveSpeaker;

  const factory ParticipantEventStates.onParticipantJoin(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnParticipantJoin;

  const factory ParticipantEventStates.onParticipantLeave(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnParticipantLeave;

  const factory ParticipantEventStates.onParticipantPinned(
          RtkRemoteParticipant participant) =
      _ParticipantEventStatesOnParticipantPinned;

  const factory ParticipantEventStates.onParticipantUnpinned() =
      _ParticipantEventStatesOnParticipantUnpinned;

  const factory ParticipantEventStates.onScreenSharesUpdated() =
      _ParticipantEventStatesOnScreenSharesUpdated;

  const factory ParticipantEventStates.onUpdate(RtkParticipants participants) =
      _ParticipantEventStatesOnUpdate;

  const factory ParticipantEventStates.onVideoUpdate(
          {required bool videoEnabled,
          required RtkRemoteParticipant participant}) =
      _ParticipantEventStatesVideoUpdate;

  const factory ParticipantEventStates.onActiveParticipantsChanged(
          {required List<RtkRemoteParticipant> activeParticipants}) =
      _OnActiveParticipantsChanged;
}
