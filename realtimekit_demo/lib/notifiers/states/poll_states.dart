import 'package:realtimekit_core/realtimekit_core.dart';

abstract class PollStates {}

class InitialPollState extends PollStates {}

class OnNewPoll extends PollStates {
  final Poll poll;

  OnNewPoll(this.poll);
}

class OnPollUpdates extends PollStates {
  final List<Poll> polls;

  OnPollUpdates(this.polls);
}
