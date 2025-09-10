import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/models/states/participant_event_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParticipantNotifier extends Notifier<ParticipantEventStates>
    implements RtkParticipantsEventListener {
  @override
  ParticipantEventStates build() {
    return const ParticipantEventStates.initial();
  }

  @override
  void onAudioUpdate(
      RtkRemoteParticipant participant,
    bool audioEnabled,
  ) {
    state = ParticipantEventStates.onAudioUpdate(
        audioEnabled: audioEnabled, participant: participant);
  }

  @override
  void onVideoUpdate(
      RtkRemoteParticipant participant,
    bool videoEnabled,
  ) {
    state = ParticipantEventStates.onVideoUpdate(
        videoEnabled: videoEnabled, participant: participant);
  }

  @override
  void onActiveSpeakerChanged(RtkRemoteParticipant? participant) {
    state = ParticipantEventStates.onActiveSpeakerChanged(participant);
  }

  @override
  void onParticipantPinned(RtkRemoteParticipant participant) {
    state = ParticipantEventStates.onParticipantPinned(participant);
  }

  @override
  void onActiveParticipantsChanged(List<RtkRemoteParticipant> active) {
    state = ParticipantEventStates.onActiveParticipantsChanged(activeParticipants: active);
  }

  @override
  void onParticipantUnpinned(RtkRemoteParticipant participant) {
    state = const ParticipantEventStates.onParticipantUnpinned();
  }



  @override
  void onUpdate(RtkParticipants participants) {
    state = ParticipantEventStates.onUpdate(participants);
  }

  @override
  void onParticipantJoin(RtkRemoteParticipant participant) {}

  @override
  void onParticipantLeave(RtkRemoteParticipant participant) {}

  @override
  void onNewBroadcastMessage(String type, Map<String, dynamic> payload) {
    // TODO: implement onNewBroadcastMessage
  }

  @override
  void onScreenShareUpdate(RtkRemoteParticipant participant, bool isEnabled) {
    state = const ParticipantEventStates.onScreenSharesUpdated();
  }
}
