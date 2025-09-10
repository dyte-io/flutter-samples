import 'package:realtimekit_core/realtimekit_core.dart';
abstract class WaitlistedParticipantStates {}

class WaitlistedParticipantInitial extends WaitlistedParticipantStates {}

class WaitlistedParticipantAccepted extends WaitlistedParticipantStates {
  final RtkMeetingParticipant participant;
  WaitlistedParticipantAccepted(this.participant);
}

class WaitlistedParticipantRejected extends WaitlistedParticipantStates {
  final RtkMeetingParticipant participant;
  WaitlistedParticipantRejected(this.participant);
}

class WaitlistedParticipantClosed extends WaitlistedParticipantStates {
  final RtkMeetingParticipant participant;
  WaitlistedParticipantClosed(this.participant);
}

class WaitlistedParticipantJoined extends WaitlistedParticipantStates {
  final RtkMeetingParticipant participant;
  WaitlistedParticipantJoined(this.participant);
}
