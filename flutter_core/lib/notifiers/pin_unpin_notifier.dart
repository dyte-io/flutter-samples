import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinNotifier extends Notifier<RtkMeetingParticipant?> {
  @override
  RtkMeetingParticipant? build() {
    return null;
  }

  void pin(RtkMeetingParticipant participant) {
    state = participant;
  }

  void unpin() {
    state = null;
  }
}
