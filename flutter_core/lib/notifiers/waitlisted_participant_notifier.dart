import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_core/notifiers/states/waitlisted_participant_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaitingRoomNotifer extends Notifier<WaitlistedParticipantStates>
    implements DyteWaitingRoomEventsListener {
  @override
  void onWaitListParticipantAccepted(DyteMeetingParticipant participant) {
    state = WaitlistedParticipantAccepted(participant);
  }

  @override
  void onWaitListParticipantRejected(DyteMeetingParticipant participant) {
    state = WaitlistedParticipantRejected(participant);
  }

  @override
  void onWaitListParticipantJoined(DyteMeetingParticipant participant) {
    state = WaitlistedParticipantJoined(participant);
  }

  @override
  void onWaitListParticipantClosed(DyteMeetingParticipant participant) {
    state = WaitlistedParticipantClosed(participant);
  }

  @override
  WaitlistedParticipantStates build() {
    return WaitlistedParticipantInitial();
  }
}
