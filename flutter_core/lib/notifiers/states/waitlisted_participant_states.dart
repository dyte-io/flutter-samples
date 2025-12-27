import 'package:realtimekit_core/realtimekit_core.dart';

abstract class WaitlistedParticipantStates {
  const WaitlistedParticipantStates();

  const factory WaitlistedParticipantStates.initial() =
      WaitlistedParticipantInitial;
  const factory WaitlistedParticipantStates.onWaitListParticipantAccepted(
          {required RtkRemoteParticipant participant}) =
      WaitlistedParticipantAccepted;
  const factory WaitlistedParticipantStates.onWaitListParticipantRejected(
          {required RtkRemoteParticipant participant}) =
      WaitlistedParticipantRejected;
  const factory WaitlistedParticipantStates.onWaitListParticipantClosed(
          {required RtkRemoteParticipant participant}) =
      WaitlistedParticipantClosed;
  const factory WaitlistedParticipantStates.onWaitListParticipantJoined(
          {required RtkRemoteParticipant participant}) =
      WaitlistedParticipantJoined;
}

class WaitlistedParticipantInitial extends WaitlistedParticipantStates {
  const WaitlistedParticipantInitial();
}

class WaitlistedParticipantAccepted extends WaitlistedParticipantStates {
  final RtkRemoteParticipant participant;
  const WaitlistedParticipantAccepted({required this.participant});
}

class WaitlistedParticipantRejected extends WaitlistedParticipantStates {
  final RtkRemoteParticipant participant;
  const WaitlistedParticipantRejected({required this.participant});
}

class WaitlistedParticipantClosed extends WaitlistedParticipantStates {
  final RtkRemoteParticipant participant;
  const WaitlistedParticipantClosed({required this.participant});
}

class WaitlistedParticipantJoined extends WaitlistedParticipantStates {
  final RtkRemoteParticipant participant;
  const WaitlistedParticipantJoined({required this.participant});
}
