import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realtimekit_core/realtimekit_core.dart';

class PinNotifier extends Notifier<RtkRemoteParticipant?>
    implements RtkParticipantsEventListener {
  @override
  void onParticipantPinned(RtkRemoteParticipant participant) {
    log('onParticipantPinned: ${participant.id}', name: 'RealtimeKitClient');
    state = participant;
  }

  @override
  void onParticipantUnpinned(RtkRemoteParticipant participant) {
    state = null;
  }

  @override
  RtkRemoteParticipant? build() {
    return null;
  }

  @override
  void onActiveParticipantsChanged(List<RtkRemoteParticipant> active) {}

  @override
  void onActiveSpeakerChanged(RtkRemoteParticipant? participant) {}

  @override
  void onAudioUpdate(
       RtkRemoteParticipant participant,bool audioEnabled,) {}


  @override
  void onParticipantJoin(RtkRemoteParticipant participant) {}

  @override
  void onParticipantLeave(RtkRemoteParticipant participant) {}



  @override
  void onUpdate(RtkParticipants participants) {}

  @override
  void onVideoUpdate(
      RtkRemoteParticipant participant, bool videoEnabled,) {}

  @override
  void onNewBroadcastMessage(String type, Map<String, dynamic> payload) {
    // TODO: implement onNewBroadcastMessage
  }

  @override
  void onScreenShareUpdate(RtkRemoteParticipant participant, bool isEnabled) {
    // TODO: implement onScreenShareUpdate
  }
}
