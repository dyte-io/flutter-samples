import 'dart:developer';

import 'package:dyte_core/dyte_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinNotifier extends Notifier<DyteMeetingParticipant?>
    implements DyteParticipantEventsListener {
  @override
  void onParticipantPinned(DyteMeetingParticipant participant) {
    log('onParticipantPinned: ${participant.id}', name: 'DyteClient');
    state = participant;
  }

  @override
  void onParticipantUnpinned(DyteMeetingParticipant participant) {
    state = null;
  }

  @override
  DyteMeetingParticipant? build() {
    return null;
  }

  @override
  void onActiveParticipantsChanged(List<DyteJoinedMeetingParticipant> active) {}

  @override
  void onActiveSpeakerChanged(DyteJoinedMeetingParticipant participant) {}

  @override
  void onAudioUpdate(
      bool audioEnabled, DyteJoinedMeetingParticipant participant) {}

  @override
  void onNoActiveSpeaker() {}

  @override
  void onParticipantJoin(DyteJoinedMeetingParticipant participant) {}

  @override
  void onParticipantLeave(DyteJoinedMeetingParticipant participant) {}

  @override
  void onScreenShareEnded(DyteJoinedMeetingParticipant participant) {}

  @override
  void onScreenShareStarted(DyteJoinedMeetingParticipant participant) {}

  @override
  void onScreenSharesUpdated() {}

  @override
  void onUpdate(DyteParticipants participants) {}

  @override
  void onVideoUpdate(
      bool videoEnabled, DyteJoinedMeetingParticipant participant) {}
}
