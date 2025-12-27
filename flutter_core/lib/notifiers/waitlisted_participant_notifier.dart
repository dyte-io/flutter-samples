import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/notifiers/states/waitlisted_participant_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaitingRoomNotifer extends Notifier<WaitlistedParticipantStates>
    implements RtkWaitlistEventListener {
  @override
  WaitlistedParticipantStates build() {
    return const WaitlistedParticipantStates.initial();
  }

  @override
  void onWaitListParticipantAccepted(RtkRemoteParticipant participant) {
    state = WaitlistedParticipantStates.onWaitListParticipantAccepted(
        participant: participant);
  }

  @override
  void onWaitListParticipantClosed(RtkRemoteParticipant participant) {
    state = WaitlistedParticipantStates.onWaitListParticipantClosed(
        participant: participant);
  }

  @override
  void onWaitListParticipantJoined(RtkRemoteParticipant participant) {
    state = WaitlistedParticipantStates.onWaitListParticipantJoined(
        participant: participant);
  }

  @override
  void onWaitListParticipantRejected(RtkRemoteParticipant participant) {
    state = WaitlistedParticipantStates.onWaitListParticipantRejected(
        participant: participant);
  }
}
