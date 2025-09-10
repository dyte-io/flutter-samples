import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:realtimekit_demo/notifiers/states/waitlisted_participant_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaitingRoomNotifer extends Notifier<WaitlistedParticipantStates>
    implements RtkWaitlistEventListener {
  @override
  void onWaitListParticipantAccepted(RtkMeetingParticipant participant) {
    state = WaitlistedParticipantAccepted(participant);
  }

  @override
  void onWaitListParticipantRejected(RtkMeetingParticipant participant) {
    state = WaitlistedParticipantRejected(participant);
  }

  @override
  void onWaitListParticipantJoined(RtkMeetingParticipant participant) {
    state = WaitlistedParticipantJoined(participant);
  }

  @override
  void onWaitListParticipantClosed(RtkMeetingParticipant participant) {
    state = WaitlistedParticipantClosed(participant);
  }

  @override
  WaitlistedParticipantStates build() {
    return WaitlistedParticipantInitial();
  }
}
