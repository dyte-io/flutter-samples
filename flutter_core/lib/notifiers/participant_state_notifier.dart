import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/models/states/participant_event_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParticipantNotifier extends Notifier<ParticipantEventStates>
    implements DyteParticipantEventsListener {
  @override
  ParticipantEventStates build() {
    return const ParticipantEventStates.initial();
  }

  @override
  void onAudioUpdate(
    bool audioEnabled,
    DyteMeetingParticipant participant,
  ) {
    state = ParticipantEventStates.onAudioUpdate(
        audioEnabled: audioEnabled, participant: participant);
  }

  @override
  void onVideoUpdate(
    bool videoEnabled,
    DyteMeetingParticipant participant,
  ) {
    state = ParticipantEventStates.onVideoUpdate(
        videoEnabled: videoEnabled, participant: participant);
  }

  @override
  void onActiveSpeakerChanged(DyteMeetingParticipant participant) {
    state = ParticipantEventStates.onActiveSpeakerChanged(participant);
  }

  @override
  void onNoActiveSpeaker() {
    state = const ParticipantEventStates.onNoActiveSpeaker();
  }

  @override
  void onParticipantPinned(DyteMeetingParticipant participant) {
    state = ParticipantEventStates.onParticipantPinned(participant);
  }

  @override
  void onActiveParticipantsChanged(List<DyteMeetingParticipant> active) {
    state = ParticipantEventStates.onActiveParticipantsChanged(
        activeParticipants: active);
  }

  @override
  void onParticipantUnpinned(DyteMeetingParticipant participant) {
    state = const ParticipantEventStates.onParticipantUnpinned();
  }

  @override
  void onScreenSharesUpdated() {
    state = const ParticipantEventStates.onScreenSharesUpdated();
  }

  @override
  void onUpdate(DyteParticipants participants) {
    state = ParticipantEventStates.onUpdate(participants);
  }

  @override
  void onParticipantJoin(DyteJoinedMeetingParticipant participant) {}

  @override
  void onParticipantLeave(DyteJoinedMeetingParticipant participant) {}

  @override
  void onScreenShareEnded(DyteJoinedMeetingParticipant participant) {}

  @override
  void onScreenShareStarted(DyteJoinedMeetingParticipant participant) {}
}
